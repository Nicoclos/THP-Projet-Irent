class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items or /items.json
  def index
    @items = Item.all
  end

  # GET /items/1 or /items/1.json
  def show
    @item = Item.find(params[:id])
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])

    @item.images.build


    # @user = current_user
      
    # @user.places.build #many association
  end

  # POST /items or /items.json
  def create
    @item = Item.new(title: params[:title], description: params[:description],price: params[:price],location: params[:location],img_url: params[:img_url])

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    # respond_to do |format|
    #   if @item.update(item_params)
    #     format.html { redirect_to @item, notice: "Item was successfully updated." }
    #     format.json { render :show, status: :ok, location: @item }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @item.errors, status: :unprocessable_entity }
    #   end
    # end

    @item = Item.find(params[:id])
    item_params = params.require(:item).permit(:title,:description,:price,:location, images_attributes: [:title,:format,:url_item_img])
    if @item.update(item_params)
      flash[:notice] = "produit à jour"
      redirect_to @item
    else
      render @item
    end

    # @user = current_user
    # user_params = params.require(:user).permit(:first_name,:last_name,:bio,:date_of_birth, :phone_number, :profile_picture, places_attributes: [:city_name, :zip_code, :address, :latitude, :longitude])
    # @user.update(user_params)
    # redirect_to user_path

  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
    # respond_to do |format|
    #   format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
    #   format.json { head :no_content }
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:title, :description, :price, :location, :img_url)
    end
end
