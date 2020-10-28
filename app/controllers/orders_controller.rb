class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_root, only: [:index]
  
  def index
    @item = Item.find(params[:item_id])
    @order_addres = OrderAddres.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_addres = OrderAddres.new(order_address_params)
    if  @order_addres.valid?
        pay_item
        @order_addres.save
        redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_address_params
    params.require(:order_addres).permit(:postcode, :prefecture_id, :building, :block, :city, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def  pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_address_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def move_to_root
    item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == item.user_id
  end

end
