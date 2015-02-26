class PagesController < ApplicationController
 before_action :authenticate_user!

  def home
	@nasdaq_transactions = Transaction.prepare_online_data(Transaction.from_nasdaq.most_recent_transaction)
  	@tase_transactions = Transaction.from_tase.most_recent_transaction
  end

end
