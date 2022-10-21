# frozen_string_literal: true

# rubocop:disable Style/Documentation
class RemoveNameFromUserName < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :name, :string
  end
end

# rubocop:enable Style/Documentation
