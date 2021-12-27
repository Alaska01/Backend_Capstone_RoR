class RemoveUserIdFromHouses < ActiveRecord::Migration[6.1]
  def change
    remove_column :houses, :user_id, :integer
  end
end
