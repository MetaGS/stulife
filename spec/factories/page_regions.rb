# == Schema Information
#
# Table name: page_regions
#
#  id         :integer          not null, primary key
#  country_id :integer
#  controller :string
#  action     :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :page_region do
    
  end

end
