class Stock < ActiveRecord::Base
	attr_accessor :last_trade_price, :ask_real_time
	has_many :transactions
	validates :symbol, presence: true
	validates :symbol, uniqueness: true
end
