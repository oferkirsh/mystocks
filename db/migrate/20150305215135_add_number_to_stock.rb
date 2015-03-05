class AddNumberToStock < ActiveRecord::Migration
  def change
  	add_column :stocks, :number, :integer
  end
end
