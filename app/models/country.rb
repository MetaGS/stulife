class Country < ActiveRecord::Base
  translates :name

  validates_presence_of :name
  validates_uniqueness_of :name
end
