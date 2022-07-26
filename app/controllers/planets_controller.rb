class PlanetsController < ApplicationController
  before_action :check_for_login, :only => [:index]

  def index
    @planets = Planet.all
  end

  def show 
    @planet = Planet.find params[:id]
    # @user.logs << @planet.name
  end

  def extract
    @planet = Planet.find params[:id]
    @planet.fuel *= 0.5
    @current_user.fuel += @planet.fuel
    @planet.food *= 0.5
    @current_user.food += @planet.food
    @planet.gold *= 0.5
    @current_user.gold += @planet.gold
    @planet.save
    @current_user.save
    redirect_to planet_path
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