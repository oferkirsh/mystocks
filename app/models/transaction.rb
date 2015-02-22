class Transaction < ActiveRecord::Base
	belongs_to :user
	belongs_to :stock
	
	after_save :update_stock_status

	attr_accessor :diff_from_current_price

	monetize :gross_proceeds_cents, :allow_nil => true, with_model_currency: :currency
	monetize :tax_cents, :allow_nil => true, with_model_currency: :currency
	monetize :net_proceeds_cents, :allow_nil => true, with_model_currency: :currency
	monetize :commission_cents, :allow_nil => true, with_model_currency: :currency

	scope :from_nasdaq, -> { includes(:stock).where(stocks: { exchange:  'Nasdaq'})}
	scope :from_tase, -> { includes(:stock).where(stocks: { exchange:  'TASE'})}
	scope :updated_transaction, -> { order(:updated_at).group(:stock_id) }

	def update_stock_status
		sale_quantity = Transaction.all.includes(:stock).where(stocks:{symbol: self.stock.symbol}).where(transaction_type: 'Sale').sum(:quantity)
		buy_quantity = Transaction.all.includes(:stock).where(stocks:{symbol: self.stock.symbol}).where(transaction_type: 'Buy').sum(:quantity)
		if sale_quantity == buy_quantity
			self.stock.active_stock = false
		else
			self.stock.active_stock = true
		end
		self.stock.save!
	end

	def self.get_nasdaq_data_from_yahoo(transactions)
  	all_symbols = transactions.map(&:stock).map(&:symbol)
  	data = YahooFinance.quotes(all_symbols, [:symbol,:ask_real_time,:last_trade_price], { raw: false })
	  	data.each_with_index do |stock, index|
	  		transactions[index].stock.ask_real_time = stock.ask_real_time
	  		transactions[index].stock.last_trade_price = stock.last_trade_price
	  	end
  	transactions
  	end

  	def self.get_rate_diff(transactions)
  		transactions.each do |transaction|
  			transaction.diff_from_current_price = transaction.stock.last_trade_price.to_f / transaction.rate.to_f - 1
  		end
	transactions
  	end

  	def self.prepare_online_data(transactions)
  		transactions = get_nasdaq_data_from_yahoo(transactions)
  		transactions = get_rate_diff(transactions)
  	end
end
