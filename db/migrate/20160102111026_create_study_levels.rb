class CreateStudyLevels < ActiveRecord::Migration
  def up
    create_table :study_levels do |t|
      t.string :slug, index: true
      t.timestamps null: false
    end
    StudyLevel.create_translation_table! name: :string, description: :text
  end

  def down
    drop_table :study_levels
    StudyLevel.drop_translation_table!
  end
end
