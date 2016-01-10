# == Schema Information
#
# Table name: study_levels
#
#  id         :integer          not null, primary key
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class StudyLevel < ActiveRecord::Base
  translates :name, :description

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :courses
  has_many :field_levels
  has_many :study_fields, through: :field_levels

  validates_presence_of :name
  validates_uniqueness_of :name

  def self.import
    array = ["Foundation/Diploma", "Degree", "Master", "PhD"]

    array.each do |field|
      StudyLevel.create(name: field)
    end
  end
end
