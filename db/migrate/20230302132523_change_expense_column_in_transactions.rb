class ChangeExpenseColumnInTransactions < ActiveRecord::Migration[7.0]
  def change
    change_column :transactions, :expense, :integer, using: 'expense::integer'
  end
end
