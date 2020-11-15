class ItemPurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  #ログインしたユーザー以外入れない
  before_action :set_item, only:[:index, :create]
  def index
    if current_user.id == @item.user_id || @item.item_purchase.present? 
      redirect_to root_path
    else
      @item_purchase = Purchase.new
    end
  end

  def create
    @item_purchase = Purchase.new(item_purchase_params)
    if @item_purchase.valid?
      pay_item
      @item_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_purchase_params
    params.require(:purchase).permit(:postal_code, :city, :prefecture_id, :house_number, :building_number, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: item_purchase_params[:token],
      currency: 'jpy'
    )
  end
end
