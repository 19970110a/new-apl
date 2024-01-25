class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :user_drinks
  has_many :user_characters
  has_many :characters, through: :user_characters

  # バリデーションの追加
  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true
end