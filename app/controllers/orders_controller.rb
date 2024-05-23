class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_address = OrderAddress.new
    item_information
    return unless (current_user != @item.user && !@item.order.nil?) || (current_user == @item.user)

    redirect_to root_path
  end

  def create
    @order_address = OrderAddress.new(order_params)
    item_information
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :town, :house_number, :building, :phone_number, :area_id).merge(
      item_id: params[:item_id], user_id: current_user.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def item_information
    @item = Item.find(params[:item_id])
  end
end
