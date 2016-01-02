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
end
