class Season < ApplicationRecord
  has_many :clothes_stock
  validates :name, presence: true, uniqueness: true, length: { maximum: 30 }
end
