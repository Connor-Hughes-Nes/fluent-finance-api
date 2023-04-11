# frozen_string_literal: true

class Transaction < ApplicationRecord
  # belongs_to :user
  # belongs_to :category

  has_many :budget # was budgets
end
