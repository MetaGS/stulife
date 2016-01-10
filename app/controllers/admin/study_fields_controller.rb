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

  def edit_field_levels
    @country = Country.first
    @study_field = StudyField.friendly.find(params[:id])
    @field_levels = @study_field.field_levels.sort_by { |x| x.study_level.name }
  end

  def update_field_levels
    @country = Country.first
    @study_field = StudyField.friendly.find(params[:id])
    params[:field_levels].each do |k,v|
      field_level = FieldLevel.find(k)
      field_level.update_attributes(content: v[:content])
    end
    redirect_to admin_study_fields_path, notice: "#{@study_field.name}'s description by education level updated succesfully."
  end

  private

  def study_field_params
    params[:study_field].permit!
  end
end
