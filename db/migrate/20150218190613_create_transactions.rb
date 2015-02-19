class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :type
      t.integer :quantity
      t.decimal :rate
      t.string :currency
      t.decimal :gross_proceeds
      t.decimal :tax
      t.decimal :commission
      t.decimal :net_proceeds
      t.date :registration_date
      t.date :charge_date
      t.date :value_date

      t.timestamps
    end
  end
end
