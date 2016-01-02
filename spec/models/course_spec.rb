# == Schema Information
#
# Table name: courses
#
#  id             :integer          not null, primary key
#  slug           :string
#  university_id  :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  study_field_id :integer
#  study_level_id :integer
#

require 'rails_helper'

RSpec.describe Course, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
