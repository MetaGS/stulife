class CreateCourses < ActiveRecord::Migration
  def up
    create_table :courses do |t|
      t.string :slug, index: true
      t.integer :university_id, index: true
      t.timestamps null: false
    end
    Course.create_translation_table! name: :string, description: :text
  end

  def down
    drop_table :courses
    Course.drop_translation_table!
  end
end
