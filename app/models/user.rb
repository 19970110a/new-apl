class User < ApplicationRecord
  authenticates_with_sorcery!
  belongs_to :character, optional: true
  has_many :user_characters
  has_many :records
  has_many :drinks

  # バリデーションの追加
  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true
end