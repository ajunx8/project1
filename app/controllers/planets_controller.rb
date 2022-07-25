class PlanetsController < ApplicationController
  def index
    @planets = Planet.all
  end

  def show 
    @planet = Planet.find params[:id]
  end

  private
  def planet_params
    params.require(:planet).permit(:name, :fuel, :food, :gold)
  end
end

  # def new
  #   @planet = Planet.new
  # end

  # def create
  #   @planet = Planet.create planet_params
  #   redirect_to planets_path
  # end