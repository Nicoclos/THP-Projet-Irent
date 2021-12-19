class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :current_user, only: [:show]
    before_action :same_user, only: [:update]
    before_action :set_user, only: [:show, :edit, :update]

    def show
      @user = set_user
      if @user[:has_items]== true
        @items = Item.find(user_id:@user[:id])
      end
      if @user[:has_orders]== true
        @items = Order.find(user_id:@user[:id])
      end
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


  private
  def set_user
    @user = User.find(params[:id])
  end

  def same_user
    if current_user != @user
      flash[:alert] = "You can only edit your own account"
    
    end
  end