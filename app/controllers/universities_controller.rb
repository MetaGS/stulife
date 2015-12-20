class UniversitiesController < ApplicationController
  def index
    @universities = University.where(country: @country)
  end
end
