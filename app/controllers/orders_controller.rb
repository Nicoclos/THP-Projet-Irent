class OrdersController < ApplicationController

  def index
    @item =Item.all
  end

  def show
    @order= Order.new
    @item = Item.all.find_by(id:params[:id])
    @amount=@item.price.to_i*100
    session[:price]= @amount
  end

  def create 
    user_id = current_user.id.to_s
    @order = Order.new(quantity: 1, stripe_id: user_id)
    if @order.save
      puts "Yes man"
    else
      puts "error!"
    end  
    @amount = session[:price]*100
    puts "#{@amount}"
    begin
      customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
      })
      charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: "Achat d'un produit",
      currency: 'eur',
      })
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_order_path
    end
  end

end
