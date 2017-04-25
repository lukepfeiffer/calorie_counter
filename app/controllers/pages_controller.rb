class PagesController < ApplicationController

  expose :user do
    User.new
  end

  def home
    @user = User.new
  end

end
