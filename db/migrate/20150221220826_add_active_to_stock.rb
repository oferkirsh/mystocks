class AddActiveToStock < ActiveRecord::Migration
  def change
    add_column :stocks, :active_stock, :boolean, :default => false
  end
end
