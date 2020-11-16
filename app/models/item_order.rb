class ItemOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipment_source_id, :city, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :postal_code, format:{ with: /\A\d{3}[-]\d{4}\z/ }
    validates :shipment_source_id, numericality: { other_than: 1, message: "can't be blank"  }
    validates :city
    validates :address
    validates :phone_number, format:{with: /\A\d{10,11}\z/ }
    validates :token
  end
  

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipment_source_id: shipment_source_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end