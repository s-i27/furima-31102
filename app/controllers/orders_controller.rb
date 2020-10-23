class OrdersController < ApplicationController
  def index
    @order_addres = Order_Addres.new
  end
end
