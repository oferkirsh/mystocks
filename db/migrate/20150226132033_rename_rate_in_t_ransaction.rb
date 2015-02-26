class RenameRateInTRansaction < ActiveRecord::Migration
  def change
  	rename_column :transactions, :rate, :rate_cents
  end
end
