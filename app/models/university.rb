# == Schema Information
#
# Table name: universities
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class University < ActiveRecord::Base
  translates :name, :description

  validates_presence_of :name, :description
end
