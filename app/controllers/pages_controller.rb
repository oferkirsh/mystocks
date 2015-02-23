class PagesController < ApplicationController
 before_action :authenticate_user!
 
  def home
	@nasdaq_transactions = Transaction.prepare_online_data(Transaction.from_nasdaq.updated_transaction)
  	@tase_transactions = Transaction.from_tase.updated_transaction
  end

end
