class Admin::CountriesController < Admin::AdminController
  def index
    @countries = Country.all
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)

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

    if @country.update(country_params)
      redirect_to admin_countries_path, notice: "Country updated successfully."
    else
      render :edit
    end
  end

  def destroy
    
  end

  private

  def country_params
    params[:country].permit(:name)
  end
end
