# frozen_string_literal: true

# Controller to manage user sessions by way of JWT auth tokens
class SessionsController < ApplicationController
  def create
    # NOTE: `.call` is a shortcut for `.new(args).call`
    command = AuthenticateUser.call(session_params[:email], session_params[:password], session_params[:role])

    # check command outcome
    if command.success?
      # command#result will contain the user instance, if found
      session[:user_token] = command.result.secret_token
      redirect_to root_path
    else
      flash.now[:alert] = t(command.errors.full_messages.to_sentence)
      render :new
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password, :role)
  end
end
