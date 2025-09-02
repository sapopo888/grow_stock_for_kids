class Kid < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  belongs_to :user
  has_many :clothes_stocks, dependent: :destroy
  enum :gender, { unknown: 0, male: 1, female: 2 }

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["clothes_stock"]
  end
end
