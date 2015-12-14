# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Country < ActiveRecord::Base
  translates :name

  validates_presence_of :name, :slug
  validates_uniqueness_of :name, :slug
end
