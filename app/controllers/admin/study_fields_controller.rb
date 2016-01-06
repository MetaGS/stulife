class Admin::StudyFieldsController < Admin::AdminController
  def index
    @study_fields = StudyField.all.order(:id)
  end

  def new
    @study_field = StudyField.new
  end

  def create
    @study_field = StudyField.new(study_field_params)

    if @study_field.save
      redirect_to admin_study_fields_path, notice: "Study field created successfully."
    else
      render :new
    end
  end

  def edit
    @study_field = StudyField.friendly.find(params[:id])
  end

  def update
    @study_field = StudyField.friendly.find(params[:id])

    if @study_field.update(study_field_params)
      redirect_to admin_study_fields_path, notice: "Study field updated successfully."
    else
      render :edit
    end
  end

  private

  def study_field_params
    params[:study_field].permit!
  end
end
