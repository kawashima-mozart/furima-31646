FactoryBot.define do
  factory :user do
    email { Faker::Internet.free_email }
    password { 'test111' }
    password_confirmation { password }
    nickname { 'tarou' }
    last_name_chn { '亜アあ' }
    first_name_chn { '亜アあ' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birthday { Faker::Date.between(from: '1930-01-01', to: Date.today) }
  end
end
