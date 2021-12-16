class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :current_user, only: [:show]
    
    def show
      @user = current_user

    end

  
    def edit
      @user = current_user
    end
  
    def update
      @user = current_user
      user_params = params.require(:user).permit(:first_name,:last_name,:bio,:date_of_birth, :phone_number, :profile_picture, places_attributes: [:city_name, :zip_code, :address, :latitude, :longitude])
      @user.update(user_params)
      redirect_to user_path
    end
    
  end