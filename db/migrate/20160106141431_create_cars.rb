class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :car_vendor_id, index: true
      t.integer :featured_image_id, index: true
      t.string :car_type, index: true
      t.integer :price, index: true
      t.integer :deposit_months
      t.text :description
      t.timestamps null: false
    end
  end
end
