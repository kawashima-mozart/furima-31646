FactoryBot.define do
  factory :item_order do
    postal_code { '123-4567' }
    shipment_source_id { 2 }
    city { '札幌市' }
    address { '南一丁目１−１' }
    phone_number {'12312341234' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
