class PlanetsController < ApplicationController
  before_action :check_for_login, :only => [:index]
  before_action :drain_food, :except => [:index]
  after_action :remove_log_from_session, :except => [:index, :show]

  def index
    @planets = Planet.all
    session[:new_log] = true
  end

  def show 
    @planet = Planet.find params[:id]
    if session[:new_log]
      @log = Log.new
      @log.user_id = @current_user.id
      @log.description = "You visited Planet #{ @planet.name }."
      @log.save
    end
    session[:new_log] = true
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

  def new
    @planet = Planet.new
    chance = rand(10)
    if chance > 8
      @planet.name = RandomNameGenerator.new.compose(3) + '-' + RandomNameGenerator.new.compose(5) + '-' + rand(10).to_s
      @planet.fuel = rand(100000)
      @planet.food = rand(10000)
      @planet.gold = rand(1000000)
      rand(10).times.map {
        @moon = @planet.moons.new
        @moon.name = rand(10).to_s + ('a'..'z').to_a.sample
        @moon.fuel = rand(10000)
        @moon.food = rand(4000)
        @moon.gold = rand(100000)
      } 
    elsif chance > 6
      @planet.name = RandomNameGenerator.new.compose(2) + '-' + RandomNameGenerator.new.compose(2)
      @planet.fuel = rand(35000)
      @planet.food = rand(10000)
      @planet.gold = rand(35000)
      rand(6).times.map {
        @moon = @planet.moons.new
        @moon.name = rand(10).to_s + ('a'..'z').to_a.sample
        @moon.fuel = rand(5000)
        @moon.food = rand(2000)
        @moon.gold = rand(10000)
      } 
    else
      @planet.name = RandomNameGenerator.new.compose(2)
      @planet.fuel = rand(10000)
      @planet.food = rand(6000)
      @planet.gold = rand(10000)
      rand(3).times.map {
        @moon = @planet.moons.new
        @moon.name = rand(10).to_s + ('a'..'z').to_a.sample
        @moon.fuel = rand(5000)
        @moon.food = rand(2000)
        @moon.gold = rand(10000)
      } 
    end
    @planet.save
    redirect_to @planet
  end

  private
  def planet_params
    params.require(:planet).permit(:name, :fuel, :food, :gold)
  end
end

# how to reduce the fuel based on the distance away
# fuel = distance**(1/2) * distance/10000
# max 2billion light years
# energy

# How to implement NASA API
# How to implement A Score page

# making it more interactive to allow the user to input information or 
# find information they want about the universe
