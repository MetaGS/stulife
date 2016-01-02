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

class House < ActiveRecord::Base
  belongs_to :country
  has_many :house_units
  has_many :images, as: :imageable

  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_presence_of :country_id, :name, :address, :property_type, :longitude, :latitude

  PROPERTY_TYPES = ["Condominium", "Apartment", "Single Storey", "Double Storey", "Townhouse"]

  def featured_image
    Image.find_by_imageable_type_and_imageable_id_and_id('House', id, self[:featured_image_id]) || images.first
  end

  def self.available_houses
    all.select{ |x| x.available_house_units.count > 0 }
  end

  def available_house_units
    HouseUnit.where(house_id: id).where.not(featured_image_id: nil)
  end

  def min_price
    available_house_units.minimum(:price)
  end

  def max_price
    available_house_units.maximum(:price)
  end
end