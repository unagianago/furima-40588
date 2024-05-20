class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    if user_signed_in?
      @item = Items.new
    else
      redirect_to new_user_session_path
    end
  end
  
end

private

  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
