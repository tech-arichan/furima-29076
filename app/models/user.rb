class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :item_purchases
  
  with_options presence: true do
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates :password, format: { with: PASSWORD_REGEX}
    validates :nickname
    zenkaku = /\A[ぁ-んァ-ン一-龥]/
    validates :family_name, format: { with: zenkaku, message: "is invalid. Input full-width katakana characters."}
    validates :first_name, format: { with: zenkaku, message: "is invalid. Input full-width katakana characters."}
    zenkaku_kana = /\A[ァ-ヶー－]+\z/
    validates :family_name_kana, format: { with: zenkaku_kana, message: "is invalid. Input full-width katakana characters."} 
    validates :first_name_kana, format: { with: zenkaku_kana, message: "is invalid. Input full-width katakana characters."} 
    validates :birthday
  end
end
