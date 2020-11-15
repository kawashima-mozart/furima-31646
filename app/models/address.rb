class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipment_source
  belongs_to :order

  with_options presence: true do
    validates :postal_code
    validates :shipment_source_id, numericality: { other_than: 1, message: "can't be blank"  }
    validates :city
    validates :address
    validates :phone_number 
  end
end
