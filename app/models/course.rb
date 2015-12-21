# == Schema Information
#
# Table name: courses
#
#  id            :integer          not null, primary key
#  slug          :string
#  university_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Course < ActiveRecord::Base
  translates :name, :description

  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :university

  validates_presence_of :university, :name, :description
  validates :name, :slug, uniqueness: { scope: :university_id, message: "should be unique for the university" }
end
