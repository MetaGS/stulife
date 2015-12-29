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
    if params.has_key?(:select_country)
      cookies[:country] = nil
    end

    if cookies[:country].present? && !params[:country].present? && !request.path.include?("admin")
      @country = Country.find_by_slug(cookies[:country])
      redirect_to root_path(locale: I18n.locale, country: @country.slug)
    else
      @country = Country.find_by_slug(params[:country])
      cookies[:country] = { value: params[:country], expires: 30.days.from_now }
    end
  end

  def default_url_options(options = {})
    { locale: I18n.locale, country: params[:country] }.merge options
  end

  private

  def layout_by_resource
    if request.original_fullpath.include?("admin/sign_in")
      'admin/admin_login'
    else
      'application'
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    case resource.class.name
      when "Admin" then admin_root_path
      when "User" then root_path(country: "malaysia")
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path(country: params[:country])
  end
end
