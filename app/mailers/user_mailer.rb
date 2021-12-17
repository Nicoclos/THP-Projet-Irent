class UserMailer < ApplicationMailer
    default from: 'louis.lionel@gmail.com'
    def welcome_email(user)
      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
      @user = user 
  
      #on définit une variable @url qu'on utilisera dans la view d’e-mail
      @url  = 'http://monsite.fr/login' 
  
      # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
      mail(to: @user.email, subject: 'Bienvenue au sein de la communauté IRENT !') 
    end

    def payment_buyer_confirmation(order)       
      @user = order.user_id       
      @order = order       
      @urlLogin = new_user_session_url      
      @amount = order.item.price       
      mail(to: @user.email, subject: 'Confirmation de paiement pour votre location !')     
    end      
    
    # def payment_vendor_confirmation(order)       
    #   @user = order.vendor       
    #   @order = order       
    #   @urlLogin = new_user_session_url       
    #   @amount = order.item.price       
    #   mail(to: @user.email, subject: 'Vous venez de recevoir une demande location !')     
    # end
end
