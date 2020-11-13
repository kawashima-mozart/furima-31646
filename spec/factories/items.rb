FactoryBot.define do
  factory :item do
    name { 'test' }
    text { Faker::Lorem.sentence }
    category_id { 2 }
    status_id { 2 }
    shipping_id { 2 }
    shipment_source_id { 2 }
    day_of_shipment_id { 2 }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/star.png'), filename: 'test_image.png')
    end
  end
end
