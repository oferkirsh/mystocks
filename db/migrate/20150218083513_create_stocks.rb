class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :name
      t.string :symbol
      t.text :description
      t.string :stock_exchange
      t.string :graph_url

      t.timestamps
    end
  end
end
