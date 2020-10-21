class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_at
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_date

  with_options presence: true do
    validates :image 
    validates :name
    validates :comment
    validates :price
    validates :category
    validates :status
    validates :shipping_at
    validates :shipping_area 
    validates :shipping_date
  end

  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 9_999_999, message: 'Out of setting range' }
  
  # ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :status_id
    validates :shipping_at_id
    validates :shipping_area_id
    validates :shipping_date_id
  end
end
