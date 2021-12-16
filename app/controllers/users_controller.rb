class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :current_user, only: [:show]
    
    def show
      @user = current_user

    end

    def create
      @user = User.new(params[:user])
      respond_to do |format|
      
      if @user.save
      
      UserMailer.with(user: @user).welcome_email.deliver_now
      format.html { redirect_to(@user, notice: 'User was successfully created.') }
      format.json { render json: @user, status: :created, location: @user }
      
      else
      
      format.html { render action: 'new' }
      format.json { render json: @user.errors, status: :unprocessable_entity }
      
      end
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