class AddStudyFieldAndStudyLevelToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :study_field_id, :integer, index: true
    add_column :courses, :study_level_id, :integer, index: true
  end
end