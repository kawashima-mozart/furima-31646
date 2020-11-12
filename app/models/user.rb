class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :password_confirmation
    validates :last_name_chn, format: { with: /\A[ぁ-んァ-ン一-龥]/, message:  ' is invalid.' }
    validates :first_name_chn, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: ' is invalid.' }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: ' is invalid.' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: ' is invalid.' }
    validates :birthday
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i, message: 'is invalid.' }
end
