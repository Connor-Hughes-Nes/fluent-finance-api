class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :name
      t.integer :role

      t.timestamps
    end
  end
end