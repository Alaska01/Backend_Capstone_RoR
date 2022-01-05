class CreateHouses < ActiveRecord::Migration[6.1]
  def change
    create_table :houses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :username
      t.string :house_name
      t.text :house_description

      t.timestamps
    end
  end
end
