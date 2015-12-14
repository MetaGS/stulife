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

  has_many :images, as: :imageable

  belongs_to :country

  validates_presence_of :name, :slug, :country, :description

  def description
    self[:description] || ""
  end

  def featured_image
    Image.find_by_imageable_type_and_imageable_id_and_id('University', id, self[:featured_image_id])
  end
end
