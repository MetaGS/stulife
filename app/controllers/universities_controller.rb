class UniversitiesController < ApplicationController
  def index
    @universities = University.where(country: @country)

    respond_to do |respond|
      respond.html
      respond.json
    end
  end

  def show
    @university = University.friendly.find(params[:id])
    @courses = @university.courses
  end
end
