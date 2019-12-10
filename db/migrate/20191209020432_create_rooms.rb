class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.references :user, foreign_key: true
      t.string :home_type
      t.string :room_type
      t.integer :accommodate
      t.integer :bedroom
      t.integer :bathroom
      t.string :listing_name
      t.text :summary
      t.string :address
      t.boolean :is_tv
      t.boolean :is_kitchen
      t.boolean :is_air
      t.boolean :is_heating
      t.boolean :is_internet
      t.integer :price
      t.boolean :active

      t.timestamps
    end
  end
end
