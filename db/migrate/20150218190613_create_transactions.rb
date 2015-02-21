class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :transaction_type
      t.integer :quantity
      t.decimal :rate
      t.string :currency
      t.decimal :gross_proceeds_cents
      t.decimal :tax_cents
      t.decimal :commission_cents
      t.decimal :net_proceeds_cents
      t.date :registration_date
      t.date :charge_date
      t.date :value_date

      t.timestamps
    end
  end
end
