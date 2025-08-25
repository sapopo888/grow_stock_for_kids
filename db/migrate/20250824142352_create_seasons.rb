class CreateSeasons < ActiveRecord::Migration[7.2]
  def change
    create_table :seasons do |t|
      t.string :name, null: false, limit: 30
      t.timestamps
    end
  add_index :seasons, :name, unique: true
  end
end
