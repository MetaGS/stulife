class HousesController < ApplicationController
  def index
    @university = University.where(name: params[:university]).last

    if !params[:university].blank? && params[:university] != "undefined" && !params[:lat] && !params[:lng]
      redirect_to houses_path(university: params[:university], distance: params[:distance], min_price: params[:min_price], max_price: params[:max_price], lat: @university.latitude, lng: @university.longitude)
      return
    end

    if !params[:university].blank? && params[:university] != "undefined"
      @houses = House.available_houses.within(params[:distance].blank? ? 10 : params[:distance], origin: @university)
    else
      @houses = House.available_houses
    end

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
