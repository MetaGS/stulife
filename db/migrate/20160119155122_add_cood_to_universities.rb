class AddCoodToUniversities < ActiveRecord::Migration
  def change
    add_column :universities, :latitude, :decimal
    add_column :universities, :longitude, :decimal

    change_column :houses, :latitude, 'numeric USING CAST(latitude AS numeric)'
    change_column :houses, :longitude, 'numeric USING CAST(longitude AS numeric)'

    change_column :car_vendors, :latitude, 'numeric USING CAST(latitude AS numeric)'
    change_column :car_vendors, :longitude, 'numeric USING CAST(longitude AS numeric)'

    add_index :universities, [:latitude, :longitude]
  end
end