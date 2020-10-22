class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre_id
  belongs_to_active_hash :condition_id
  belongs_to_active_hash :delivery_fee_id
  belongs_to_active_hash :delivery_date_id
  belongs_to_active_hash :prefecture_id
  belongs_to :user
  has_one_attached :image


  with_option presence: true do
    validates :name
    validates :description
    validates :price 

    with_option numericality: { other_than: 1 } do
      validates :genre_id
      validates :condition_id
      validates :delivery_fee_id
      validates :prefecture_id
      validates :delivery_date_id
    end
  end
end
