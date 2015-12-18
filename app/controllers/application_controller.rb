class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :set_country

  layout :layout_by_resource

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def set_country
    @country = Country.find_by_slug(params[:country])
    unless params[:country]
      redirect_to root_path(country: "malaysia")
    end
  end

  def default_url_options(options = {})
    { locale: I18n.locale, country: "malaysia" }.merge options
  end

  private

  def layout_by_resource
    if request.original_fullpath.include?("admin/sign_in")
      'admin/admin_login'
    else
      'application'
    end
  end
end
