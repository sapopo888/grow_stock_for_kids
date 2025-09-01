class CreateClothesStocks < ActiveRecord::Migration[7.2]
  def change
    create_table :clothes_stocks do |t|
      t.text :comment, limit: 50
      t.string :image
      t.references :kid, null: false, foreign_key: true
      t.references :season, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :size, null: false, foreign_key: true

      t.timestamps
    end
  end
end
