class OrdersController < ApplicationController
  
  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:post_code,:town,:house_number,:building,:phone_number,:area_id).merge(item_id:params[:item_id],user_id: current_user.id)
  end

end
