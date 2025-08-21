class CreateKids < ActiveRecord::Migration[7.2]
  def change
    create_table :kids do |t|
      t.string :name, null: false, limit: 20
      t.integer :gender, null: false, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
