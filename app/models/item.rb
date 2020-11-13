class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping
  belongs_to :shipment_source
  belongs_to :day_of_shipment
  has_one_attached :image

  with_options presence: true do
    validates :category, numericality: { other_than: 1 }
    validates :status, numericality: { other_than: 1 }
    validates :shipping, numericality: { other_than: 1 }
    validates :shipment_source, numericality: { other_than: 1 }
    validates :day_of_shipment, numericality: { other_than: 1 }
  end
end
