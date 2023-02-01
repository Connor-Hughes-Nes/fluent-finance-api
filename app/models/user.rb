# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :transactions
  has_many :categories
  has_many :budgets

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password,
            length: { minimum: 4 },
            if: -> { new_record? || !password.nil? }

  enum role: { admin: 0, user: 1 }


end
