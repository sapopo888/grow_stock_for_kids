class Kid < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  belongs_to :user
  has_many :clothes_stocks, dependent: :destroy
  enum :gender, { unknown: 0, male: 1, female: 2 }
end
