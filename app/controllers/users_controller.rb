class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    if current_user
      current_user
    else
      redirect_to new_user_session_path
    end
  end
end
