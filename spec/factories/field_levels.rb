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

FactoryGirl.define do
  factory :field_level do
    
  end

end
