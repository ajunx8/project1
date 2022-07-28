class UsersController < ApplicationController
  before_action :check_for_admin, :only => [:index]
  before_action :drain_food, :only => [:show]
  after_action :remove_log_from_session

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = @current_user
  end

  def update
    @current_user.fuel = 10000
    @current_user.food = 2000
    @current_user.gold = 10000
    @current_user.logs.delete_all
    @current_user.save
    session[:time] = nil
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
