class BuildingsController < ApplicationController
  before_action :set_building, only: %i[ show edit update destroy ]
  
  def index
    @buildings = Building.all
    #@apartments = Apartment.includes(:puerta).order(id: :asc)
  end
  
  def new
    @building = Building.new
    set_apartments
  end

  def show
    @apartments = Apartment.includes(:puerta).order(id: :asc)
  end

  def edit
    set_apartments
  end

  def create
    @building = Building.new(params_building)
    if @building.save
      redirect_to buildings_path
    else
      set_apartments
      render :new
    end
  end

  def update
    if @building.update(params_building)
      redirect_to buildings_path
    else
      set_apartments
      render :edit
    end
  end

  def destroy
    @building.destroy
    
  
  rescue
    flash[:building_destroy_error]="No puedo eliminar este edificio"
    redirect_to buildings_path, notice: "No puedo eliminar este edificio"
  end



  private
  def set_building
    @building = Building.find(params[:id])
  rescue
    flash[:set_building_error] = "⁉ No encontrado.... #{params[:id]}"
    redirect_to buildings_path
  end

  def params_building
    params.require(:building).permit(:nombre, :direccion, :ciudad, :region, :apartment_id, :fotito)
  end

  def set_apartments
    @apartments = Apartment.all
  end

end
