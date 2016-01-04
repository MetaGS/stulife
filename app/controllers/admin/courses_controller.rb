class Admin::CoursesController < Admin::AdminController
  before_action :set_university
  before_action :set_course, only: [:edit, :update, :destroy]

  def index
    @courses = @university.courses
  end

  def new
    @course = @university.courses.new
  end

  def create
    @course = @university.courses.new(course_params)

    if @course.save
      redirect_to admin_university_courses_path(@university), notice: "Course created successfully."
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @course.update(course_params)
      redirect_to admin_university_courses_path(@university), notice: "Course updated successfully."
    else
      render :edit
    end
  end

  def destroy
    if @course.destroy
      redirect_to admin_university_courses_path(@university), notice: "Course deleted successfully."
    else
      redirect_to admin_university_courses_path(@university), notice: "Course cannot be deleted, please contact the web administrator."
    end
  end

  private

  def set_university
    @university = University.friendly.find(params[:university_id])
  end

  def set_course
    @course = @university.courses.friendly.find(params[:id])
  end

  def course_params
    params[:course].permit(:name, :slug, :university_id, :description, :study_level_id, :study_field_id)
  end
end