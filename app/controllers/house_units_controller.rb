class HouseUnitsController < ApplicationController
  def show
    @house = House.friendly.find(params[:house_id])
    @unit = @house.house_units.find(params[:id])
  end
end
