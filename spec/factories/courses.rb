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

FactoryGirl.define do
  factory :course do
    
  end

end
