class ClothesStock < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :season
  belongs_to :category
  belongs_to :size

  validates :comment, length: { maximum: 50 }
  validates :image
end
