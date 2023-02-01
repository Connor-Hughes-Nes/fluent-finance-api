class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :transaction_type
      t.integer :transaction_amount
      t.integer :total_income
      t.integer :expense_id
      t.string :expense
      t.datetime :expense_date
      t.string :income_type
      t.integer :expense_amount
      t.string :expense_type

      t.timestamps
    end
  end
end
