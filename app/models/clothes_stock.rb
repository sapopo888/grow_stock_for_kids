class ClothesStock < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :season
  belongs_to :category
  belongs_to :size

  validates :comment, length: { maximum: 50 }
  mount_uploader :image, ImageUploader # この記述により画像の取得やアップロードが簡単にできたり、アップロードされた画像のURLを取得する「image_urlメソッド」が使えるようになる
end
