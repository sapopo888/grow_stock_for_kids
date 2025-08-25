class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 15 }
end
