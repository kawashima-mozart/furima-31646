class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :email
    validates :encrypted_password
    validates :nickname
    validates :last_name_chn
    validates :first_name_chn
    validates :last_name_kana
    validates :first_name_kana
    validates :birthday
  end
end