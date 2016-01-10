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
end
