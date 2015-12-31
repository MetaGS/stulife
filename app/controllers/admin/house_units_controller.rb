class Admin::HouseUnitsController < Admin::AdminController
  before_action :set_house

  def index
    @units = @house.house_units
  end

  def new
    @unit = @house.house_units.new
  end

  def create
    @unit = @house.house_units.new(house_unit_params)

    if @unit.save
      redirect_to edit_admin_house_house_unit_path(@house, @unit), notice: "Unit successfully created."
    else
      render :new
    end
  end

  def edit
    @unit = @house.house_units.find(params[:id])
  end

  def update
    @unit = @house.house_units.find(params[:id])
    if @unit.update(house_unit_params)
      redirect_to edit_admin_house_house_unit_path(@house, @unit), notice: "Unit successfully updated."
    else
      render :edit
    end
  end

  private

  def set_house
    @house = House.friendly.find(params[:house_id])
  end

  def house_unit_params
    params[:house_unit].permit!
  end
end
