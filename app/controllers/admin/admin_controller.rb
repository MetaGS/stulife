class Admin::AdminController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin/admin'

  def dashboard

  end

  def save_page_region
    @region = PageRegion.find_by_country_id_and_name(params[:country_id], params[:name])

    if @region.update(content: params[:content])
      render text: "Content saved successfully."
    else
      render text: "Content cannot be saved, please contact the web administrator."
    end
  end
end