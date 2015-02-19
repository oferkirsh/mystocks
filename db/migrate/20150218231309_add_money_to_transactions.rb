class AddMoneyToTransactions < ActiveRecord::Migration
  def change
  	change_table :transactions do |t|
      t.money :gross_proceeds,  currency: { present: false }
    end
  end
end
