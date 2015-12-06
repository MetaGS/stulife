# == Schema Information
#
# Table name: page_regions
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PageRegion < ActiveRecord::Base
  translates :content
end
