# frozen_string_literal: true

# Controller to manage user authentication by way of JWT authentication
class AuthenticationController < ApplicationController
  prepend SimpleCommand
  include ActiveModel::Validations

  before_action :authorize_request, except: :authenticate

  # POST /login
  def authenticate
    @user = User.find_by(params[:id])
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     first_name: @user.first_name, last_name: @user.last_name }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
