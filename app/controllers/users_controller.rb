class UsersController < ApplicationController
  before_action :authenticate_user, only: [:edit, :update]
  expose :user

  def create
    user = User.new(user_params)
    if user.save
      redirect_to meals_path, notice: { "success" => "Sign up successful!" }
    else
      render '/'
    end
  end

  def edit
  end

  def update
    if user.update(user_params)
      redirect_to meals_path, notice: { "successful" => "Update was successful!" }
    else
      render edit_user_path(user.id)
    end
  end

  private

  def authenticate_user
    user = User.find(params[:id])
    if user != current_user
      redirect_to root_path, notice: { "danger" => "Invalid credentials" }
    end
  end

  def user_params
    params.require(:user).permit(
      :email,
      :first_name,
      :last_name,
      :age,
      :password,
      :password_confirmation
    )
  end
end
