class Admin::CountriesController < Admin::AdminController
  def index
    @countries = Country.all
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(params[:country].permit(:name))

    if @country.save
      redirect_to admin_countries_path, notice: "Country created successfully."
    else
      render :new
    end
  end

  def edit
    @country = Country.find_by_id(params[:id])
  end

  def update
    @country = Country.find_by_id(params[:id])

    if @country.update(params[:country].permit(:name))
      redirect_to admin_countries_path, notice: "Country updated successfully."
    else
      render :edit
    end
  end

  def destroy
    
  end
end
