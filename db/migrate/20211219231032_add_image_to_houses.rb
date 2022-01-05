class AddImageToHouses < ActiveRecord::Migration[6.1]
  def change
    add_column :houses, :images, :text
  end
end
