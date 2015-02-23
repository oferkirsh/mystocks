class Stock < ActiveRecord::Base
	attr_accessor :last_trade_price, :ask_real_time, :change_in_percent
	has_many :transactions
	validates :symbol, presence: true
	validates :symbol, uniqueness: true
end
