class PagesController < ApplicationController
  layout 'landing', only: [:landing, :country]

  def landing

  end

  def country
    
  end

  def home

  end
end
