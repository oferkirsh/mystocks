class RenameExchangeInStock < ActiveRecord::Migration
  def change
  	rename_column :stocks, :stock_exchange, :exchange
  end
end
