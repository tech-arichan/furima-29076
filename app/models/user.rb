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
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/} do
      validates :family_name
      validates :first_name
    end
    # 振り仮名：苗字と名前、全角（カタカナ）/\A[ァ-ヶー－]+\z/
    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :family_name_kana
      validates :first_name_kana
    end
    # 誕生日必須
    validates :birthday
  end
end
