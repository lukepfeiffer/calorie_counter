class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      sign_in(user)
      redirect_to meals_path(message: 'successful_sign_in'), notice: { "success" => "Sign in successful!" }
    else
      redirect_to root_path(message: 'invalid_login'), notice: { "danger" => "Email or password did not match" }
    end
  end

  def destroy
    sign_out_user
    redirect_to :root, notice: { "Successful" => "Sign out successful!" }
  end
end
