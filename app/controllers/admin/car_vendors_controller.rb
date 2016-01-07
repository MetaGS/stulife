class Admin::CarVendorsController < Admin::AdminController
  def index
    @car_vendors = CarVendor.all
  end

  def new
    @car_vendor = CarVendor.new
  end

  def create
    @car_vendor = CarVendor.new(car_vendor_params)

    if @car_vendor.save
      redirect_to admin_car_vendors_path, notice: "Car Vendor created successfully."
    else
      render :new
    end
  end

  def edit
    @car_vendor = CarVendor.friendly.find(params[:id])
  end

  def update
    @car_vendor = CarVendor.friendly.find(params[:id])

    if @car_vendor.update(car_vendor_params)
      redirect_to edit_admin_car_vendor_path(@car_vendor), notice: "Car Vendor updated successfully."
    else
      render :edit
    end
  end

  private

  def car_vendor_params
    params[:car_vendor].permit!
  end
end
