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

require 'rails_helper'

RSpec.describe University, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
