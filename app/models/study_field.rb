# == Schema Information
#
# Table name: study_fields
#
#  id         :integer          not null, primary key
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class StudyField < ActiveRecord::Base
  translates :name, :description

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :courses

  validates_presence_of :name
  validates_uniqueness_of :name

  def self.import
    fields = "Pre-University Programme, Accounting & Finance, Agriculture, Architecture, Arts & Design, Business Management & Administration*, Computing & IT, Communication & Broadcasting, Economics, Education, Engineering, Environmental, Finance*, Hospitality & Tourism, Humanities, Languages, Law, Manufacturing, Marketing & Sales, Mathematics & Statistics, Media, Medical Diagnostic & Treatment, Medicine & Healthcare, Occupational Health, Personal Services, Science, Social Sciences, Social Services, Transport, Veterinary"
    array = fields.split(",")

    array.each do |field|
      StudyField.create(name: field)
    end
  end
end
