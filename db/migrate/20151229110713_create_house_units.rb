class CreateHouseUnits < ActiveRecord::Migration
  def change
    create_table :house_units do |t|
      t.integer :house_id, index: true
      t.integer :featured_image_id, index: true
      t.string :unit_type, index: true
      t.integer :size, index: true
      t.integer :price, index: true
      t.string :owner_name, index: true
      t.string :owner_mobile
      t.string :owner_email
      t.integer :security_deposit_months
      t.integer :utilities_deposit_months
      t.text :description
      t.timestamps null: false
    end
  end
end