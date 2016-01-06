class CreateCarVendors < ActiveRecord::Migration
  def change
    create_table :car_vendors do |t|
      t.integer :country_id, index: true
      t.integer :featured_image_id, index: true
      t.string :name, index: true
      t.string :slug, index: true
      t.string :address, index: true
      t.string :longitude, index: true
      t.string :latitude, index: true
      t.string :owner_name, index: true
      t.string :owner_mobile
      t.string :owner_email
      t.timestamps null: false
    end
  end
end
