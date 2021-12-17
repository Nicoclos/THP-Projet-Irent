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

    item= session[:a]
    user_id = current_user.id.to_s
    user_usr = current_user.id
    stripe_id= user_usr+item
    @dl = Item.all.find_by(id:item)
    @order = Order.new(quantity: 1, stripe_id: stripe_id,user_id:user_usr,item_id:item)
    if @order.save
      puts "Yes man"
    else
      puts "error!"
    end
    
    @amount = params[:price].to_i
    @price_converted = @amount * 100

    # @amount = session[:price]*100
    
    # puts "#{@dl.inspect}"
    # puts "#{@amount}"
    # @dl[:available]=false
    # @dl.update(:available=>@dl[:available])
    begin
      customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
      })
      charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @price_converted,
      description: "Achat d'un produit",
      currency: 'eur',
      })

      if charge
        @order = Order.find(params[:order_id])
        # @order.is_paid = true
        # @order.save
        flash[:success] = "Bravo, tu as réservé ta séance et payé #{@amount} €!"
        payment_buyer_confirmation(@order)
        # payment_vendor_confirmation(@order)
        redirect_to user_path(current_user.id)
      end
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_order_path
    end
    def payment_buyer_confirmation(order)
      UserMailer.payment_buyer_confirmation(order).deliver_now
    end
  end
end
