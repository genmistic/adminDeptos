class ApartmentsController < ApplicationController
  before_action :set_apartment, only: %i[ show edit update destroy ]

  def index
    @apartments = Apartment.all
  end
  
  def new
    @apartment = Apartment.new
    set_buildings
  end

  def show
  end

  def edit
    set_buildings
  end

  def create
    @apartment = Apartment.new(params_apartment)
    if @apartment.save
      redirect_to apartments_path
    else
      set_buildings
      render :new
    end
  end

  def update
    if @apartment.update(params_apartment)
      redirect_to apartments_path
    else
      set_buildings
      render :edit
    end
  end

  def destroy
    @apartment.destroy
    redirect_to apartments_path
  end

  private
  def set_apartment
    @apartment = Apartment.find(params[:id])
  rescue
    flash[:set_apartment_error] = "⁉ No encontrado....  #{params[:id]}"
    redirect_to apartments_path
  end

  def params_apartment
    params.require(:apartment).permit(:puerta, :building_id)
  end

  def set_buildings
    @buildings = Building.all
   
  end

end