FactoryGirl.define do
  factory :user do
    email "oferkirsh11@gmail.com"
    password  "oferofer"
  end

  factory :stock do
  	symbol 'QQQ'
  	description 'my stocks'
  	exchange 'Nasdaq'
  end

  factory :transaction do
  	quantity 200
  	rate '68.00'
  	gross_proceeds '10000'
  	tax 100
  	commission 20
  	net_proceeds 20000
  	registration_date '20/03/2014'
  	charge_date '21/03/2014'
  	value_date '22/03/2014'
   	trait :the_stock do
	    stock do
	      Stock.find_by(symbol: 'QQQ') || FactoryGirl.create(:stock, symbol: 'QQQ')
	    end
  	end
  	#association :stock,factory: :stock,symbol: "kuku",strategy: :build
  	factory :nasdaq_sale_transaction do
  			currency 'USD'
  			transaction_type 'Sale'
	end
	factory :nasdaq_buy_transaction do
  			currency 'USD'
  			transaction_type 'Buy'
	end
	factory :tase_sale_transaction do
  			currency 'ILS'
  			transaction_type 'Sale'
	end
	factory :tase_buy_transaction do
  			currency 'ILS'
  			transaction_type 'Buy'	
	end
  end
end