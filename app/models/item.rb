class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_date
  belongs_to_active_hash :prefecture
  belongs_to :user
  has_one_attached :image


  with_options presence: true do
    validates :name
    validates :description
    validates :price 

    with_options numericality: { other_than: 1 } do
      validates :genre_id
      validates :condition_id
      validates :delivery_fee_id
      validates :prefecture_id
      validates :delivery_date_id
    end
  end
end
