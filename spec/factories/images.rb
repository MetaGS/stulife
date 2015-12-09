# == Schema Information
#
# Table name: images
#
#  id                 :integer          not null, primary key
#  name               :string
#  imageable_id       :integer
#  imageable_type     :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

FactoryGirl.define do
  factory :image do
    
  end

end
