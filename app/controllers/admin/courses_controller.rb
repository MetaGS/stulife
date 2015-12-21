class Admin::CoursesController < Admin::AdminController
  before_action :set_university

  def index
    
  end

  def show
    @course = @university.courses.friendly.find(params[:id])
  end

  private

  def set_university
    @university = University.friendly.find(params[:university_id])
  end
end