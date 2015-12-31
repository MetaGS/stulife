class HousesController < ApplicationController
  def index
    @houses = House.all

    respond_to do |respond|
      respond.html
      respond.json
    end
  end

  def show
    @house = House.friendly.find(params[:id])
    @units = @house.available_house_units
  end
end
