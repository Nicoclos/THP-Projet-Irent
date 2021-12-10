class OrdersController < ApplicationController
  def index
  end
  
  def new
    @item = Item.first
    @amount=(@item.price*100).to_i 
  end
  
  def create
    
    @stripe_amount = 
    begin
      customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
      })
      charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @stripe_amount,
      description: "Achat d'un produit",
      currency: 'eur',
      })
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_order_path
    end
  end
end
