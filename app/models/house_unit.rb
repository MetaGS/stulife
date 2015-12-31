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

class HouseUnit < ActiveRecord::Base
  belongs_to :house
  has_many :images, as: :imageable

  validates_presence_of :unit_type, :size, :price, :owner_name, :owner_mobile, :security_deposit_months, :utilities_deposit_months

  UNIT_TYPE = ["House", "Master Room", "2nd Room", "3rd Room", "4th Room"]

  def featured_image
    Image.find_by_imageable_type_and_imageable_id_and_id('House', id, self[:featured_image_id]) || images.first
  end
end
