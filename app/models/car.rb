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

class Car < ActiveRecord::Base
  belongs_to :car_vendor
  has_many :images, as: :imageable

  CAR_TYPE = ["Sedan", "Hatchback", "MPV", "SUV", "Pickup", "Wagon", "Coupe", "Convertible", "Hybrid"]
  BRAND = ["AlfaRomeo", "AstonMartin", "Audi", "Bentley", "BMW", "Bufori", "Caterham", "Chana", "Chery", "Chevrolet", "Citroen", "Ferrari", "Fiat", "Ford", "GreatWall", "Honda", "Hyundai", "Infiniti", "Isuzu", "Jaguar", "Jeep", "Kia", "Lamborghini", "LandRover", "Lexus", "Lotus", "Mahindra", "Maserati", "Maxus", "Mazda", "McLaren", "Mercedes-Benz", "MINI", "Mitsubishi", "Nissan", "Perodua", "Peugeot", "Porsche", "Proton", "Renault", "Rolls-Royce", "Skoda", "SsangYong", "Subaru", "Suzuki", "Tata", "Toyota", "Volkswagen", "Volvo"]

  def name
    "#{brand} #{model} (#{year})"
  end

  def featured_image
    Image.find_by_imageable_type_and_imageable_id_and_id(self.class.class_name, id, self[:featured_image_id]) || images.first
  end
end