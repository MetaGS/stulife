# == Schema Information
#
# Table name: universities
#
#  id                :integer          not null, primary key
#  slug              :string
#  country_id        :integer
#  featured_image_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

FactoryGirl.define do
  factory :university do
    
  end

end
