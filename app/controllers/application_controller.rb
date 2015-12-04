class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :layout_by_resource

  private

  def layout_by_resource
    if request.original_fullpath.include?("admin/sign_in")
      'admin/admin_login'
    else
      'application'
    end
  end
end
