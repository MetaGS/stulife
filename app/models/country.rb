# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Country < ActiveRecord::Base
  translates :name

  validates_presence_of :name
  validates_uniqueness_of :name
end
