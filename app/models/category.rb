class Category < ApplicationRecord
  has_many :clothes_stock
  validates :name, presence: true, uniqueness: true, length: { maximum: 15 }
end
