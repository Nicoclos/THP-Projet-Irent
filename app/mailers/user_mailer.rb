class UserMailer < ApplicationMailer

    default from: 'louis.lionel@gmail.com'
    def welcome_email(user)
      @user = user 
      @url  = 'http://monsite.fr/login' 
  
      mail(to: @user.email, subject: 'Bienvenue au sein de la communauté IRENT !') 
    end

    def payment_email(order)       
      # @user = order.user_id       
      @order = order       
      @urlLogin = new_user_session_url      
      # @amount = order.item.price       
      mail(to: "louis@gmail.com", subject: 'Confirmation de paiement pour votre location !')     
    end      
    
    # def payment_vendor_confirmation(order)       
    #   @user = order.vendor       
    #   @order = order       
    #   @urlLogin = new_user_session_url       
    #   @amount = order.item.price       
    #   mail(to: @user.email, subject: 'Vous venez de recevoir une demande location !')     
    # end
end
