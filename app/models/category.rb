class Category < ApplicationRecord
  has_many :clothes_stock
  validates :name, presence: true, uniqueness: true, length: { maximum: 15 }
  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end
