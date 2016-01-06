class PagesController < ApplicationController
  layout 'landing', only: [:landing, :country]

  def landing

  end

  def country
    
  end

  def home
    @study_fields = StudyField.all.sort_by { |x| x.name }
  end
end
