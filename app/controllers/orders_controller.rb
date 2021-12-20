class OrdersController < ApplicationController
  def index
    @item =Item.all
  end

  def show
    order= Order.new
    order.save
    @item = Item.all.find_by(id:params[:id])
    @amount=@item.price.to_i*100
    session[:price]= @amount
    session[:a] =@item[:id]
  end

  def create
    item_id= session[:a]
    user_id = current_user.id
    user_usr = current_user
    stripe_id= item_id + user_id

    @amount = Item.find(item_id).price
    
      customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
        })
      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: (@amount*100).to_i,
        description: "Achat d'un produit",
        currency: 'eur',
        })
          
        if charge
           flash[:success] = "Bravo, !"
            @order = Order.create(quantity: 1, stripe_id: stripe_id,user_id: user_id,item_id: item_id)
            payment_buyer_confirmation(@order)
        else
          puts = "ça ne fonctionne pas"
        end
          rescue Stripe::CardError => e
            flash[:error] = e.message
            redirect_to new_order_path
        end
        
    
      
      
      def payment_buyer_confirmation(order)
        UserMailer.payment_email(order).deliver_now
      end
      
end