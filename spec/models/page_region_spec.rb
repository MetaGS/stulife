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

require 'rails_helper'

RSpec.describe PageRegion, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
