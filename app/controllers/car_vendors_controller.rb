class CarVendorsController < ApplicationController
  def index
    @car_vendors = CarVendor.available_vendors

    respond_to do |respond|
      respond.html
      respond.json
    end
  end

  def show
    @car_vendor = CarVendor.friendly.find(params[:id])
    @cars = @car_vendor.available_cars
  end
end
