class Stock < ActiveRecord::Base
	attr_accessor :last_trade_price, :ask_real_time
	has_many :transactions
end
