class Season < ApplicationRecord
  has_many :clothes_stocks
  validates :name, presence: true, uniqueness: true, length: { maximum: 30 }

  def self.ransackable_attributes(auth_object = nil)
    ["id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["clothes_stock"]
  end


end
