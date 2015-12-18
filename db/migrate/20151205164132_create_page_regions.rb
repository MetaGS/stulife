class CreatePageRegions < ActiveRecord::Migration
  def up
    create_table :page_regions do |t|
      t.integer :country_id, index: true
      t.string :controller, index: true
      t.string :action, index: true
      t.string :name, index: true
      t.timestamps null: false
    end
    PageRegion.create_translation_table! content: :text
  end

  def down
    drop_table :page_regions
    PageRegion.drop_translation_table!
  end
end
