# frozen_string_literal: true

# Application management with JWT authentication
class ApplicationController < ActionController::API
  prepend SimpleCommand
  before_action :authenticate_request

  attr_reader :current_user

  def not_found
    render json: { error: 'not_found' }
  end

  def call
    user
  end

  private

  def authenticate_request
    @current_user = AuthorizeRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end


