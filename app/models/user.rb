class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 大文字小文字を区別したい場合は{ case_sensitive: true }を仕様（DB側は区別しない）
  validates :nickname,         presence: true,uniqueness:  { case_sensitive: true }
  validates :last_name,        presence: true
  validates :first_name,       presence: true
  validates :last_name_kana,   presence: true
  validates :first_name_kana,  presence: true
  validates :birthday,         presence: true

end
