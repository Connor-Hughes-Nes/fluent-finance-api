# frozen_string_literal: true

# rubocop:disable Style/Documentation
class User < ApplicationRecord
  enum role: %i[admin user]

  # has_many categories, through: :transactions
  # has_many transactions
  # has_one budget
  # Returns a random token.
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  # def remember
  #   self.remember_token = User.new_token
  #   update_attribute(:remember_digest, User.digest(remember_token))
  #   remember_digest
  # end

  # Returns a session token to prevent session hijacking.
  # We reuse the remember digest for convenience.
  # def session_token
  #   remember_digest || remember
  # end

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?

    BCrypt::Password.new(digest).is_password?(token)
  end

  # Sets the password reset attributes.
  # def create_reset_digest
  #   self.reset_token = User.new_token
  #   update_columns(reset_digest: User.digest(reset_token), reset_sent_at: Time.zone.now)
  # end

end
# rubocop:enable Style/Documentation
