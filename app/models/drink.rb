class Drink < ApplicationRecord
  belongs_to :category
  belongs_to :user, optional: true
  has_many :records
  has_many :users, through: :records

  validates :name, presence: true
  validates :degree, numericality: true
  validates :volume, numericality: { only_integer: true }
end