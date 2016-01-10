class CreateFieldLevels < ActiveRecord::Migration
  def up
    create_table :field_levels do |t|
      t.integer :country_id, index: true
      t.integer :study_field_id, index: true
      t.integer :study_level_id, index: true
      t.timestamps null: false
    end
    FieldLevel.create_translation_table! content: :text
  end

  def down
    drop_table :field_levels
    FieldLevel.drop_translation_table!
  end
end