class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new] 
  def index
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.create(item_params)
    if @item.valid?
      redirect_to root_path
    else
      render :new
    end
  end

 private
  def item_params
    params.require(:item).permit(:image,:name,:comment,:category_id,:shipping_area_id,:shipping_at_id,:shipping_date_id,:status_id,:price).merge(user_id: current_user.id)
  end  
end
