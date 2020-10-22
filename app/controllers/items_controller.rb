class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_index, only: [:edit]
  before_action :item_find, only: [:show, :edit, :update]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private
    def item_params
      params.require(:item).permit(:image, :name, :comment, :category_id, :shipping_area_id, :shipping_at_id, :shipping_date_id, :status_id, :price).merge(user_id: current_user.id)
    end

    def move_to_index
      item = Item.find(params[:id])
      if current_user.id != item.user_id
        redirect_to action: :index 
      end
    end
  
    def item_find
      @item = Item.find(params[:id])
    end
    
end
