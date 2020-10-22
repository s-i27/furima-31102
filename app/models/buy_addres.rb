class BuyAddres
  include ActiveModel: Model:
  attr_accessor :postal_code, :prefecture, :building, :block, :city, :phone_number

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
    # ユーザーの情報を保存し、「user」という変数に入れている
    user = User.all
    item = Item.all
    # 購入情報の情報を保存
    Donation.create(user_id: user.id, item_id: item.id)
    # 住所の情報を保存
    Address.create(postalcode: postalcode, prefecture: prefecture, building: building,block: block, city: city, phone_number: phone_number,buy_id: buy.id)
  end
end