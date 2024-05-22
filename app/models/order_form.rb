class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:post_code,:town,:house_number,:building,:phone_number,:area_id,:order_id

  validates :user_id,:item_id,:post_code,:area_id,:town,:house_number,:phone_number, presence: true
  validates :post_code, format: { with: /\A\d{3}-\d{4}\z/}
  validates :phone_number, format: { with: /\A\d{10,11}\z/}

  def save
    ActiveRecord::Base.transaction do
      order = Order.create(
        user_id: user_id,
        item_id: item_id
      )

      Addresses.create(
        order_id: order.id,
        post_code: post_code,
        town: town,
        house_number: house_number,
        building: building,
        phone_number: phone_number,
        area_id: area_id
      )
    end

  end

end