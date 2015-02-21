class Transaction < ActiveRecord::Base
	belongs_to :user
	belongs_to :stock
	
	monetize :gross_proceeds_cents, :allow_nil => true, with_model_currency: :currency
	monetize :tax_cents, :allow_nil => true, with_model_currency: :currency
	monetize :net_proceeds_cents, :allow_nil => true, with_model_currency: :currency
	monetize :commission_cents, :allow_nil => true, with_model_currency: :currency

end
