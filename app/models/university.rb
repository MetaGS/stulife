# == Schema Information
#
# Table name: universities
#
#  id         :integer          not null, primary key
#  slug       :string
#  country_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class University < ActiveRecord::Base
  translates :name, :description

  has_many :images, as: :imageable

  belongs_to :country

  validates_presence_of :name, :slug, :country, :description

  def description
    self[:description] || ""
  end
end
