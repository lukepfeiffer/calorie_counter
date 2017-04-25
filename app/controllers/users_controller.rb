class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      redirect_to meals_path(message: 'successful'), notice: { "success" => "Sign up successful!" }
    else
      render '/'
    end
  end

  private

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
