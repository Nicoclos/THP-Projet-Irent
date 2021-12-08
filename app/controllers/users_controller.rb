class UsersController < ApplicationController
    before_action :authenticate_user!
    # before_action :user_exists?, :check_user, only: [:show]
    
    def show
      @user = current_user
    end
  
    def edit
      @user = current_user
    end
  
    def update
      @user = current_user
      user_params = params.require(:user).permit(:first_name,:last_name,:address,:bio,:age, :phone_number)
      @user.update(user_params)
      redirect_to user_path
    end
  end