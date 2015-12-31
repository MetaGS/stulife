# == Schema Information
#
# Table name: house_units
#
#  id                       :integer          not null, primary key
#  house_id                 :integer
#  featured_image_id        :integer
#  unit_type                :string
#  size                     :integer
#  price                    :integer
#  owner_name               :string
#  owner_mobile             :string
#  owner_email              :string
#  security_deposit_months  :integer
#  utilities_deposit_months :integer
#  description              :text
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

FactoryGirl.define do
  factory :house_unit do
    
  end

end
