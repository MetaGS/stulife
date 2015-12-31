class Admin::HousesController < Admin::AdminController
  def index
    @houses = House.all
  end

  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)

    if @house.save
      redirect_to admin_houses_path, notice: "House created successfully."
    else
      render :new
    end
  end

  def edit
    @house = House.friendly.find(params[:id])
  end

  def update
    @house = House.friendly.find(params[:id])

    if @house.update(house_params)
      redirect_to edit_admin_house_path(@house), notice: "House updated successfully."
    else
      render :edit
    end
  end

  private

  def house_params
    params[:house].permit!
  end
end
