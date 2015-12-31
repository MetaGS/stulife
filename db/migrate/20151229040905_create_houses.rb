class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.integer :country_id, index: true
      t.integer :featured_image_id, index: true
      t.string :name, index: true
      t.string :slug, index: true
      t.string :address, index: true
      t.string :property_type, index: true
      t.string :longitude, index: true
      t.string :latitude, index: true
      t.text :description
      t.timestamps null: false
    end
  end
end