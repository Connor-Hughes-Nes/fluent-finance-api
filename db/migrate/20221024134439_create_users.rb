# frozen_string_literal: true

# Create User migration with each column and type defined
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: false do |t|
      t.integer :id
      t.string :first_name
      t.string :last_name
      t.integer :role

      t.timestamps
    end
  end
end
