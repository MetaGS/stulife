class Admin::ImagesController < Admin::AdminController
  def index
    @images = Image.all

    respond_to do |format|
      format.html
      format.json { render json: @images.map{|image| image.to_jq_upload } }
    end
  end

  def show
    @image = Image.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @image }
    end
  end

  def new
    @image = Image.new

    respond_to do |format|
      format.html
      format.json { render json: @image }
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def create
    @image = Image.new(imageable_type: params[:imageable_type], imageable_id: params[:imageable_id], image: params[:image])

    respond_to do |format|
      if @image.save
        format.html {
          render :json => [@image.to_jq_upload].to_json,
                 :content_type => 'text/html',
                 :layout => false
        }
        format.json { render json: {files: [@image.to_jq_upload]}, status: :created, location: admin_image_path(@image) }
      else
        format.html { render action: "new" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @image = Image.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:image])
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to admin_images_path }
      format.json { head :no_content }
    end
  end
end
