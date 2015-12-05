class Course < ActiveRecord::Base
  translates :name, :description
end
