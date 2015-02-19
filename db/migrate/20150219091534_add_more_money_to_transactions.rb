class AddMoreMoneyToTransactions < ActiveRecord::Migration
  def change
  	change_table :transactions do |t|
      t.money :commission,  currency: { present: false }
      t.money :net_proceeds,  currency: { present: false }
      t.money :tax,  currency: { present: false }
    end
  end
end
