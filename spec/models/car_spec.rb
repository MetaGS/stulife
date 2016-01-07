# == Schema Information
#
# Table name: cars
#
#  id                :integer          not null, primary key
#  car_vendor_id     :integer
#  featured_image_id :integer
#  car_type          :string
#  brand             :string
#  model             :string
#  year              :string
#  price             :integer
#  deposit_months    :integer
#  description       :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'rails_helper'

RSpec.describe Car, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
