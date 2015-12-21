class UniversitiesController < ApplicationController
  def index
    @universities = University.where(country: @country)
  end

  def show
    @university = University.friendly.find(params[:id])
    @courses = @university.courses
  end
end
