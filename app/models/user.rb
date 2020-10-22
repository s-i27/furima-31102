class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  # 大文字小文字を区別したい場合は{ case_sensitive: true }を仕様（DB側は区別しない）
  validates :nickname,         presence: true, uniqueness: { case_sensitive: true }
  validates :last_name,        presence: true, format: { with: /\A[一-龥ぁ-ん]/, message: 'Full-width characters' }
  validates :first_name,       presence: true, format: { with: /\A[一-龥ぁ-ん]/, message: 'Full-width characters' }
  validates :last_name_kana,   presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'Full-width katakana characters' }
  validates :first_name_kana,  presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'Full-width katakana characters' }
  validates :birthday,         presence: true
  validates :password,         format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'Include both letters and numbers' }
end
