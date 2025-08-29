class Size < ApplicationRecord
  has_many :clothes_stock
  validates :name, presence: true, uniqueness: true
end
