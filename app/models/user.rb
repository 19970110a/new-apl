class User < ApplicationRecord
  authenticates_with_sorcery!

  # バリデーションの追加
  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true
end