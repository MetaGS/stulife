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
end
