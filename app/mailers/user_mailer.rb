class UserMailer < ApplicationMailer

    default from: 'louis.lionel@gmail.com'
    def welcome_email(user)
      @user = user 
      @url  = 'https://irent-project.herokuapp.com/users/sign_in' 
  
      mail(to: @user.email, subject: 'Bienvenue au sein de la communauté IRENT !') 
    end

    def payment_email(order)       
      # @user = order.user_id       
      @order = order       
      @urlLogin = new_user_session_url      
      # @amount = order.item.price       
      mail(to: @order.user.email, subject: 'Confirmation de paiement pour votre location !')     
    end      
    
    # def payment_vendor_confirmation(order)       
    #   @user = order.vendor       
    #   @order = order       
    #   @urlLogin = new_user_session_url       
    #   @amount = order.item.price       
    #   mail(to: @user.email, subject: 'Vous venez de recevoir une demande location !')     
    # end
end
