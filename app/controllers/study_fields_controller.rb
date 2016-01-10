class StudyFieldsController < ApplicationController
  def field_levels
    @study_field = StudyField.friendly.find(params[:id])
    @field_levels = @study_field.field_levels
  end
end