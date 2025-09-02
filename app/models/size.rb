class Size < ApplicationRecord
  has_many :clothes_stocks
  validates :name, presence: true, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    [ "name", "id" ]
  end
end
