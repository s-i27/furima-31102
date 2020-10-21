class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_at
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :status

  validates :image, presence: true
  validates :name, presence: true
  validates :comment, presence: true
  validates :price, presence: true
  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 9_999_999, message: 'Out of setting range' }
  validates :category, :shipping_area, :shipping_at, :shipping_date, :status, presence: true
  # ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1, message: 'Select' }
  validates :shipping_area_id, numericality: { other_than: 1, message: 'Select' }
  validates :shipping_at_id, numericality: { other_than: 1, message: 'Select' }
  validates :shipping_date_id, numericality: { other_than: 1, message: 'Select' }
  validates :status_id, numericality: { other_than: 1, message: 'Select' }
end
