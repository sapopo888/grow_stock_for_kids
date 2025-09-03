class Kid < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  belongs_to :user
  has_many :clothes_stocks, dependent: :destroy
  enum :gender, { unknown: 0, male: 1, female: 2 }
  enum :color, { default: 0, pink: 1, blue: 2, green: 3, purple: 4, orange: 5, black: 6 }

  def self.ransackable_attributes(auth_object = nil)
    [ "name", "id" ]
  end
end
