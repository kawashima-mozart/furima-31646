FactoryBot.define do
  factory :user do
    email {test@mail.com}
    password {000000}
    nickname {tarou}
    last_name_chn {"山田"}
    first_name_chn {"太郎"}
    last_name_kana {"ヤマダ"}
    first_name_kana {"タロウ"}
    birthday  {1900-10-1}
  end
end
