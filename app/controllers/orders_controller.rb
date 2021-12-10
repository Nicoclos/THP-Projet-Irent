class OrdersController < ApplicationController

  def index
    @item =Item.all
  end
  
  def show
    @item = Item.all.find_by(id:params[:id])
    @amount=(@item.price*100).to_i 
  end
  
  def create
    @amount = params[:total].to_i
    begin
      customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
      })
      charge = Stripe::Charge.create({
      customer: customer.id,
      amount: 1500,
      description: "Achat d'un produit",
      currency: 'eur',
      })
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_order_path
    end
  end
end
