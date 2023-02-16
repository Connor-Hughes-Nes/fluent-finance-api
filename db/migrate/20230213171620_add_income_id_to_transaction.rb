class AddIncomeIdToTransaction < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :income_id, :integer
  end
end
