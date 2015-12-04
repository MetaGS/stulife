class Admin::AdminController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin/admin'

  def dashboard

  end
end
