# == Schema Information
#
# Table name: field_levels
#
#  id             :integer          not null, primary key
#  country_id     :integer
#  study_field_id :integer
#  study_level_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe FieldLevel, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
