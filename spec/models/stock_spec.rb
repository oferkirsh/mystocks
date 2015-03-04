require "spec_helper"
require 'shoulda/matchers'

describe Stock do 
	context "check attributes" do
		subject (:stock) { build(:stock) }
		it 'name is QQQ' do
			expect(stock.symbol).to eq('QQQ')
		end
		it 'description is my stocks' do
			expect(stock.description).to eq('my stocks')
		end
		it 'exchange is Nasdaq' do
			expect(stock.exchange).to eq('Nasdaq')
		end	
	end
	it 'should have active_status false if total stocks transactions quantity is 0' do
	  	nasdaq_buy = create(:nasdaq_buy_transaction, :the_stock,quantity: 300)
	  	expect{create(:nasdaq_sale_transaction, :the_stock, quantity: 300)}.to change {Stock.find_by(symbol: 'QQQ').active_stock}.to false
  	end
  	it 'should have active_status true if total stocks transactions is positive' do
	  	nasdaq_buy = create(:nasdaq_buy_transaction, :the_stock,quantity: 400)
	  	expect(Stock.find_by(symbol: 'QQQ').active_stock).to be true
  	end
end


# describe 'stock_active_status' do
#   it 'should have active_status true if transactions quantity are positive' do
#   	nasdaq_buy = create(:nasdaq_buy_transaction, :the_stock,quantity: 400)
#   	nasdaq_sale = create(:nasdaq_sale_transaction, :the_stock, quantity: 300)

#   end
# end
