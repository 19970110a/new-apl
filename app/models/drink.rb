class Drink < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :records
  has_many :users, through: :records
  has_many :drinks
  
  validates :name, presence: true
  validates :degree, numericality: true
  validates :volume, numericality: { only_integer: true }
end