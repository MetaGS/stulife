class Admin::CarsController < Admin::AdminController
  before_action :set_car_vendor

  def index
    @cars = @car_vendor.cars
  end

  def new
    @car = @car_vendor.cars.new
  end

  def create
    @car = @car_vendor.cars.new(car_params)

    if @car.save
      redirect_to edit_admin_car_vendor_car_path(@car_vendor, @car), notice: "Car successfully created."
    else
      render :new
    end
  end

  def edit
    @car = @car_vendor.cars.find(params[:id])
  end

  def update
    @car = @car_vendor.cars.find(params[:id])
    if @car.update(car_params)
      redirect_to edit_admin_car_vendor_car_path(@car_vendor, @car), notice: "Car successfully updated."
    else
      render :edit
    end
  end

  private

  def set_car_vendor
    @car_vendor = CarVendor.friendly.find(params[:car_vendor_id])
  end

  def car_params
    params[:car].permit!
  end
end
