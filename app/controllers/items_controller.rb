class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit]

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

  def show
  end

  def edit
    return if current_user == @item.user && @item.order.nil?

    redirect_to root_path
  end

  def update
    item = Item.find(params[:id])

    if item.update(item_params)
      redirect_to item_path(item.id)
    else
      @item = item
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy if current_user == item.user
    redirect_to root_path
  end
end

private

def set_item
  @item = Item.find(params[:id])
end

def item_params
  params.require(:item).permit(:name, :content, :image, :price, :category_id, :condition_id, :area_id, :delivery_cost_id,
                               :delivery_time_id).merge(user_id: current_user.id)
end
