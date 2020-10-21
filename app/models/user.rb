class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  #全ての項目必須。「with_options」でまとめる
  with_options presence: true do
    #validates :email...メール：一意性(#uniqueness: true)、＠を含む必要がある。いずれもデフォルトで設定されている
    #パスワード：６文字以上はデフォルト（length:{minimum:6}）、半角英数字混同
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates :password, format: { with: PASSWORD_REGEX}
    # ニックネーム必須
    validates :nickname
    
    # 本名：苗字と名前、全角（漢字・平仮名・カタカナ）
    zenkaku = /\A[ぁ-んァ-ン一-龥]/
    validates :family_name, format: { with: zenkaku, message: "is invalid. Input full-width katakana characters."}
    validates :first_name, format: { with: zenkaku, message: "is invalid. Input full-width katakana characters."}

    # 振り仮名：苗字と名前、全角（カタカナ）/\A[ァ-ヶー－]+\z/
    zenkaku_kana = /\A[ァ-ヶー－]+\z/
    validates :family_name_kana, format: { with: zenkaku_kana, message: "is invalid. Input full-width katakana characters."} 
    validates :first_name_kana, format: { with: zenkaku_kana, message: "is invalid. Input full-width katakana characters."} 

    # 誕生日必須
    validates :birthday
  end
end
