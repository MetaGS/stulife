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
  has_many :cars

  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_presence_of :country_id, :name, :longitude, :latitude, :owner_name, :owner_mobile, :owner_email

  def featured_image
    Image.find_by_imageable_type_and_imageable_id_and_id(self.class.class_name, id, self[:featured_image_id]) || images.first
  end

  def self.available_vendors
    all.select{ |x| x.available_cars.count > 0 }
  end

  def available_cars
    Car.where(car_vendor_id: id).where.not(featured_image_id: nil)
  end

  def min_price
    available_cars.minimum(:price)
  end

  def max_price
    available_cars.maximum(:price)
  end
end
