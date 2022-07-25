class MoonsController < ApplicationController
  def show
    @moon = Moon.find params[:id]
  end
end
