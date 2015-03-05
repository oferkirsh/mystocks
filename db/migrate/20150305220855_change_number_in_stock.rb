class ChangeNumberInStock < ActiveRecord::Migration
  def change
  	rename_column :stocks, :number, :num
  end
end
