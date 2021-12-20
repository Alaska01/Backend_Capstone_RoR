class RemoveUsernameFromHouses < ActiveRecord::Migration[6.1]
  def change
    remove_column :houses, :username, :string
  end
end
