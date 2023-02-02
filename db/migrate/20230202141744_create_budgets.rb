class CreateBudgets < ActiveRecord::Migration[7.0]
  def change
    create_table :budgets do |t|
      t.integer :budget_id
      t.string :budget_name
      t.integer :budget_amount

      t.timestamps
    end
  end
end
