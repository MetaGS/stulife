class Admin::CoursesController < Admin::AdminController
  before_action :set_university

  def index

  end

  private

  def set_university
    @university = University.friendly.find(params[:university_id])
  end
end
