class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :current_user, only: [:show]
    before_action :set_user, only: [:show, :edit, :update]
    before_action :same_user, only: [:edit, :update]

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
      user_params = params.require(:user).permit(:first_name,:last_name,:bio,:date_of_birth, :phone_number, :profile_picture, :city_name, :zip_code, :address, :latitude, :longitude)
      @user.update(user_params)
      redirect_to user_path
    end


  private
  def set_user
    @user = User.find(params[:id])
  end

  def same_user
    if current_user != @user && !current_user.admin?
      flash[:alert] = "You can only edit your own account"
      redirect_to @user
    end
    end
  end