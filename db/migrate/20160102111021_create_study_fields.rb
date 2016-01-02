class CreateStudyFields < ActiveRecord::Migration
  def up
    create_table :study_fields do |t|
      t.string :slug, index: true
      t.timestamps null: false
    end
    StudyField.create_translation_table! name: :string, description: :text
  end

  def down
    drop_table :study_fields
    StudyField.drop_translation_table!
  end
end
