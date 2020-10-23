class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  
  def index
    @item = Item.find(params[:item_id])
    @order_addres = OrderAddres.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_addres = OrderAddres.new(order_address_params)
    
    if @order_addres.valid?
        @order_addres.save
        redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_address_params
    params.require(:order_addres).permit(:postcode, :prefecture_id, :building, :block, :city, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

end
