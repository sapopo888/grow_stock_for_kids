class ClothesStock < ApplicationRecord
  belongs_to :kid
  belongs_to :season
  belongs_to :category
  belongs_to :size

  validates :comment, length: { maximum: 50 }
  mount_uploader :image, ImageUploader # この記述により画像の取得やアップロードが簡単にできたり、アップロードされた画像のURLを取得する「image_urlメソッド」が使えるようになる

  # 直接の属性
  def self.ransackable_attributes(auth_object = nil)
    [ "comment" ]
  end

  # 関連モデル経由の属性
  def self.ransackable_associations(auth_object = nil)
    [ "kid", "category", "season", "size" ]
  end
end
