# == Schema Information
#
# Table name: car_vendors
#
#  id                :integer          not null, primary key
#  country_id        :integer
#  featured_image_id :integer
#  name              :string
#  slug              :string
#  address           :string
#  longitude         :string
#  latitude          :string
#  owner_name        :string
#  owner_mobile      :string
#  owner_email       :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class CarVendor < ActiveRecord::Base
  belongs_to :country
end
