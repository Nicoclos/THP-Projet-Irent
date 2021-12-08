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
    end
  end