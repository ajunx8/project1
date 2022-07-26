class MoonsController < ApplicationController
  def show
    @moon = Moon.find params[:id]
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
