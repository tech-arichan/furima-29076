class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :image, :name, :description, :price, :genre_id, :condition_id, :delivery_fee_id, :delivery_date_id, :hoge, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_purchase_id

  #バリデーション
  with_options presence: true do
    #itemバリデーション
    validates :image
    validates :name
    validates :description
    validates :price, format: {with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    with_options numericality: { other_than: 0, message: "can't be blank" } do
      validates :genre_id
      validates :condition_id
      validates :delivery_fee_id
      validates :prefecture_id
      validates :delivery_date_id
    end
    # 「address」バリデーション
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :house_number
    validates :building_name
    validates :phone_number
  end

  def save
    item = Item.create(image: image, name: name, description: description, genre_id: genre_id, condition_id: condition_id, delivery_date_id: delivery_date_id, delivery_fee_id: delivery_fee_id, prefecture_id: prefecture_id, price: price)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, item_purchase_id: item_purchase.id)
    ItemPurchass.create(user_id: current_user.id, item_id: item.id)
  end

end