class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :genre_id, :condtion_id, :delivery_fee_id, :delivery_date_id, :prefecture_id, :price).merge(user_id: current_user.id)
  end
end
