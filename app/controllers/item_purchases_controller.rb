class ItemPurchasesController < ApplicationController
  before_action :set_item, only:[:index, :create]

  def index
    @item_purchase = Purchase.new
  end

  def create
    @item_purchase = Purchase.new(item_purchase_params)
    if @item_purchase.valid?
      @item_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_purchase_params
    params.require(:purchase).permit(:postal_code, :city, :prefecture_id, :house_number, :building_number, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
