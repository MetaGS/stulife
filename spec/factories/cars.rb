# == Schema Information
#
# Table name: cars
#
#  id                :integer          not null, primary key
#  car_vendor_id     :integer
#  featured_image_id :integer
#  car_type          :string
#  brand             :string
#  model             :string
#  year              :string
#  price             :integer
#  deposit_months    :integer
#  description       :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

FactoryGirl.define do
  factory :car do
    
  end

end
