class Admin::UniversitiesController < Admin::AdminController
  def index
    @universities = University.all
  end

  def new
    @university = University.new
  end

  def create
    @university = University.new(university_params)

    if @university.save
      redirect_to admin_universities_path, notice: "University created succesfully."
    else
      render :new
    end
  end

  def edit
    @university = University.find_by_id(params[:id])
  end

  def update
    @university = University.find_by_id(params[:id])

    if @university.update(university_params)
      redirect_to admin_universities_path, notice: "University updated succesfully."
    else
      render :new
    end
  end

  def destroy

  end

  private

  def university_params
    params[:university].permit(:name, :slug, :country_id, :description, :featured_image_id)
  end
end
