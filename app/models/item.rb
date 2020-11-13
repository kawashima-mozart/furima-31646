class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping
  belongs_to :shipment_source
  belongs_to :day_of_shipment
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :text
    validates :category, numericality: { other_than: 1, message: "can't be blank" }
    validates :status, numericality: { other_than: 1, message: "can't be blank" }
    validates :shipping, numericality: { other_than: 1, message: "can't be blank" }
    validates :shipment_source, numericality: { other_than: 1, message: "can't be blank" }
    validates :day_of_shipment, numericality: { other_than: 1, message: "can't be blank" }
    validates :price, numericality: { only_integer: true } 
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
  validates :price, format: { with: /\A[0-9]+\z/ } 
end
