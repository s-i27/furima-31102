class OrderAddres
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :building, :block, :city, :phone_number,:user_id, :item_id
with_options presence: true do
  validates :postcode
  validates :prefecture_id
  validates :block
  validates :city
  validates :phone_number
end

  # ジャンルの選択が「--」の時は保存できないようにする
  validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }

  def save
    # 購入情報の情報を保存
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, building: building,block: block, city: city, phone_number: phone_number, order_id:order.id)
    # 住所の情報を保存
  end
end