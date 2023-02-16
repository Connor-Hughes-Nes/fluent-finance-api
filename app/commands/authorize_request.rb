# frozen_string_literal: true

class AuthorizeRequest
  prepend SimpleCommand

  # def initialize(headers = {})
  #   @headers = headers
  # end
  #
  # def call
  #   user
  # end
  #
  # private
  #
  # attr_reader :headers
  #
  # def user
  #   @user ||= User.find(decoded_id)
  #   @user || (errors.add(:token, 'Invalid token') && nil)
  # end
  #
  # def decoded_id
  #   @decoded_id ||= JsonWebToken.decode(http_auth_header)[:id]
  # end
  #
  #
  # def http_auth_header
  #   if headers['Authorization'].present?
  #     return headers['Authorization'].split(' ').last
  #   else
  #     errors.add(:token, 'Missing token')
  #   end
  #   nil
  # end

end
