class CreateUniversities < ActiveRecord::Migration
  def up
    create_table :universities do |t|
      t.string :slug, index: true
      t.integer :country_id, index: true
      t.integer :featured_image_id
      t.timestamps null: false
    end
    University.create_translation_table! name: :string, description: :text
  end

  def down
    drop_table :universities
    University.drop_translation_table!
  end
end
