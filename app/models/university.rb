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

class University < ActiveRecord::Base
  translates :name, :description

  extend FriendlyId
  friendly_id :name, use: :slugged

  acts_as_mappable :default_units => :kms,
                   :default_formula => :flat,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude

  has_many :images, as: :imageable
  has_many :courses

  belongs_to :country

  validates_presence_of :name, :slug, :country, :description

  def description
    self[:description] || ""
  end

  def featured_image
    Image.find_by_imageable_type_and_imageable_id_and_id('University', id, self[:featured_image_id]) || images.first
  end
end
