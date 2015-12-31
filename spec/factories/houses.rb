# == Schema Information
#
# Table name: houses
#
#  id                :integer          not null, primary key
#  country_id        :integer
#  featured_image_id :integer
#  name              :string
#  slug              :string
#  address           :string
#  property_type     :string
#  longitude         :string
#  latitude          :string
#  description       :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

FactoryGirl.define do
  factory :house do
    
  end

end
