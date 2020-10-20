class Item < ApplicationRecord

  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_at
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :status

  validates :name, presence: true
  validates :comment, presence: true
  validates :price, presence: true
  validates :image, presence: true
  validates :category, :shipping_area, :shipping_at, :shipping_date, :status, presence: true
  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 } 

end
