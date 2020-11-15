require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe '商品購入情報の保存' do
    before do
      @purchase = FactoryBot.build(:purchase)
    end

    it '全ての値が正しく入力されていれば保存できる' do
      expect(@purchase).to be_valid
    end
    it '建物名が空の場合も登録できる' do
      @purchase.building_name = nil
      @purchase.valid?
      expect(@purchase).to be_valid
    end
    
    it '郵便番号が空だと保存できない' do
      @purchase.postal_code = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号にハイフンがないと保存できない' do
      @purchase.postal_code = "1234567"
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it '都道府県を選択していない時、保存できない' do
      @purchase.prefecture_id = 0
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町村が空だと保存できない' do
      @purchase.city = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空だと保存できない' do
      @purchase.house_number = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("House number can't be blank")
    end
    it '電話番号が空だと保存できない' do
      @purchase.phone_number = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号の文字数、10〜11以外は保存できない' do
      @purchase.phone_number = "123456789"
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number is invalid")
    end
    it '電話番号はハイフンが存在していたら保存できない' do
      @purchase.phone_number = "123-45678910"
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number is invalid")
    end
    it '電話番号は半角数字以外は保存できない' do
      @purchase.phone_number = "123456789１0"
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number is invalid")
    end
    it "tokenが空では登録できないこと" do
      @purchase.token = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Token can't be blank")
    end
  end
end
