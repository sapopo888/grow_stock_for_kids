class AddColorToKids < ActiveRecord::Migration[7.2]
  def change
    add_column :kids, :color, :integer, null: false, default: 0
  end
end
