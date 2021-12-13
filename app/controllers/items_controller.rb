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



  end

  # POST /items or /items.json
  def create
 
    @item = Item.new(item_params)

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

    @item = Item.find(params[:id])
    item_params = params.require(:item).permit(:title,:description,:price,:location, images_attributes: [:title,:format,:url_item_img])
    if @item.update(item_params)
      flash[:notice] = "produit à jour"
      redirect_to @item
    else
      render @item
    end

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
      params.require(:item).permit(:title, :summary, :description, :price, :available_duration, :available_start, :available_end)
    end
end
