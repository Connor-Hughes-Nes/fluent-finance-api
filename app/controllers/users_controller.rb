# frozen_string_literal: true

# Manage users
class UsersController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_user, except: %i[create index]

  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/{username}
  def show
    @user = User.find(params[:id])

    # render json: @user, status: :ok
  end

  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PUT /users/{username}
  def update
    if @user.update(user_params)
      flash[:success] = 'Profile updated'
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /users/{username}
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'User deleted'
  end

  private

  def find_user
    @user = User.find_by(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end

  def user_params
    # params.permit(
    #   :first_name, :last_name, :email, :password, :password_confirmation
    # )
    params.require(
      :user
    ).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
