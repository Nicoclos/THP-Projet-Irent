class ImgProductsController < ApplicationController
    
    def create
      @item = Item.find(params[:item_id])
      @item.img_products.attach(params[:img_products])
      redirect_to(item_path(@item))
    end

  end