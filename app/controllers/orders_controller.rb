class OrdersController < ApplicationController
  
  def index
    @item = Item.find(params[:id])
    @order_address = OrderAddress.new
  end

end
