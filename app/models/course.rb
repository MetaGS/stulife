# == Schema Information
#
# Table name: courses
#
#  id             :integer          not null, primary key
#  slug           :string
#  university_id  :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  study_field_id :integer
#  study_level_id :integer
#

class Course < ActiveRecord::Base
  translates :name, :description

  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :study_level
  belongs_to :study_field
  belongs_to :university

  validates_presence_of :university, :name, :description, :study_level_id, :study_field_id
  validates :name, :slug, uniqueness: { scope: :university_id, message: "should be unique for the university" }

  def similar_courses
    f1 = Course.where.not(id: self)
    words = self.name.downcase.strip.split.uniq
    f1.with_translations.where('lower(name) ~ ?', words.join('|'))
  end
end
