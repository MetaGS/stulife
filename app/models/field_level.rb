# == Schema Information
#
# Table name: field_levels
#
#  id             :integer          not null, primary key
#  country_id     :integer
#  study_field_id :integer
#  study_level_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class FieldLevel < ActiveRecord::Base
  translates :content

  belongs_to :country
  belongs_to :study_field
  belongs_to :study_level

  validates_presence_of :country_id, :study_field_id, :study_level_id

  default_scope { order(:study_level_id) }

  def self.generate
    Country.all.each do |country|
      StudyField.all.each do |study_field|
        StudyLevel.all.each do |study_level|
          field_level = where(country: country, study_field: study_field, study_level: study_level)
          create(country: country, study_field: study_field, study_level: study_level) if field_level.blank?
        end
      end
    end
  end
end