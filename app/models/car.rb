# == Schema Information
#
# Table name: cars
#
#  id                :integer          not null, primary key
#  car_vendor_id     :integer
#  featured_image_id :integer
#  car_type          :string
#  price             :integer
#  deposit_months    :integer
#  description       :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Car < ActiveRecord::Base
  belongs_to :car_vendor

  has_one :featured_image, class_name: 'Image', as: :imageable, foreign_key: :featured_image_id
end
