class CreateSizes < ActiveRecord::Migration[7.2]
  def change
    create_table :sizes do |t|
      t.integer :name, null: false
      t.timestamps
    end
    add_index :sizes, :name, unique: true
  end
end
