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
    validates :image
    validates :name
    validates :description
    validates :price, format: {with: /\A[0-9]+\z/ },numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    validates :genre_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :condition_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :delivery_fee_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :delivery_date_id, numericality: { other_than: 0, message: "can't be blank" }
  end
end