class MoonsController < ApplicationController
  before_action :drain_food, :only => [:show]
  after_action :remove_log_from_session


  def show
    @moon = Moon.find params[:id]
    if session[:new_log]
      @log = Log.new
      @log.user_id = @current_user.id
      @log.description = "You visited Moon #{ @moon.name } of Planet: #{ @moon.planet.name }"
      @log.save
    end
  end

  def extract
    @moon = Moon.find params[:id]
    @moon.fuel *= 0.5
    @current_user.fuel += @moon.fuel
    @moon.food *= 0.5
    @current_user.food += @moon.food
    @moon.gold *= 0.5
    @current_user.gold += @moon.gold
    @moon.save
    @current_user.save
    redirect_to moon_path
  end

end
