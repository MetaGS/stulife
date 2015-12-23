class CoursesController < ApplicationController
  def index
    
  end

  def show
    @university = University.friendly.find(params[:university_id])
    @course = @university.courses.friendly.find(params[:id])
  end
end
