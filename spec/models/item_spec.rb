require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品の出品がうまくいく時' do
      it '全ての項目が正しく入力されれば登録できる' do
        expect(@item).to be_valid
      end
    end
    
    context '商品の出品ができない時' do
      it '画像は１枚必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名がないと登録できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'カテゴリー情報を選択していないと登録できない' do
        @item.genre_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre can't be blank")
      end

      it '商品状態の情報を選択していないと登録できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料の情報がないと登録できない' do
        @item.delivery_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
     
      it '発送元の地域情報がないと登録できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
     
      it '発送までの日数情報がないと登録できない' do
        @item.delivery_date_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date can't be blank")
      end
     
      it '価格の情報がないと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is invalid", "Price is not a number")
      end
     
      it '価格が¥300未満は登録できない' do
        @item.price= 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '価格が¥10,000,000円以上だと登録できない' do
        @item.price= 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
     
      it '価格は半角数字以外登録できない' do
        @item.price = "９００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
