# frozen_string_literal: true

# Application management with JWT authentication
class ApplicationController < ActionController::API
  prepend SimpleCommand
  before_action :authenticate_request


  # protect_from_forgery prepend: true, with: :exception
  # include JWTSessions::RailsAuthorization
  # rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized

  def not_found
    render json: { error: 'not_found' }
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

  def call
    user
  end

  def authenticate_request
    @current_user = AuthorizeRequest.call(request.headers).result
  end

  # private
  #
  # attr_reader :headers
  #
  # def user
  #   @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
  #   @user || (errors.add(:token, 'Invalid token') && nil)
  # end
  #
  # def decoded_auth_token
  #   @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  # end
  #
  # def http_auth_header
  #   return headers['Authorization'].split.last if headers['Authorization'].present?
  #
  #   errors.add(:token, 'Missing token')
  #   nil
  # end
end
