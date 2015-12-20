# == Schema Information
#
# Table name: page_regions
#
#  id         :integer          not null, primary key
#  country_id :integer
#  controller :string
#  action     :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PageRegion < ActiveRecord::Base
  translates :content

  belongs_to :country

  validates_presence_of :country_id, :controller, :action, :name

  def self.pages
    select("DISTINCT ON (controller, action) *")
  end
end
