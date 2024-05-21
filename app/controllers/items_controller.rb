class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.includes(:user).order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
end

private

def item_params
  params.require(:item).permit(:name, :content, :image, :price, :category_id, :condition_id, :area_id, :delivery_cost_id,
                               :delivery_time_id).merge(user_id: current_user.id)
end
