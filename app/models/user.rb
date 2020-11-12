class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :password_confirmation 
    validates :last_name_chn, format: {with: /\A[ぁ-んァ-ン一-龥]/, message:  "is invalid.全角（漢字・ひらがな・カタカナ）で入力してください"}
    validates :first_name_chn, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid.全角（漢字・ひらがな・カタカナ）で入力してください"}
    validates :last_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "is invalid.全角（カタカナ）で入力してください"}
    validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "is invalid.全角（カタカナ）で入力してください"}
    validates :birthday
  end
end
