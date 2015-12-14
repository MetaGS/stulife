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

class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_presence :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  include Rails.application.routes.url_helpers

  def to_jq_upload
    {
        "id" => read_attribute(:id),
        "name" => read_attribute(:image_file_name),
        "size" => read_attribute(:image_file_size),
        "originalUrl" => image.url(:original),
        "thumbnailUrl" => image.url(:thumb),
        "deleteUrl" => admin_image_path(self, locale: ""),
        "deleteType" => "delete"
    }
  end
end
