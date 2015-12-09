class TinymceAssetsController < ApplicationController
  def create
    image = Image.create!(name: params[:alt], image: params[:file])

    render json: {
               image: {
                   url: view_context.image_url(image.image.url)
               }
           }, content_type: "text/html"
  end
end
