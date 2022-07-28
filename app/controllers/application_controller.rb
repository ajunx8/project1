class ApplicationController < ActionController::Base
    before_action :fetch_user

    def fetch_user
        @current_user = User.find_by :id => session[:user_id] if session[:user_id].present?
        session[:user_id] = nil unless @current_user.present?
    end

    def check_for_login
        redirect_to login_path unless @current_user.present?
    end

    def check_for_admin
        redirect_to login_path unless (@current_user.present? && @current_user.admin?)
    end

    def drain_food
        time_change = 0
        if session[:time].present?
            time_change = Time.new - session[:time].to_datetime
            @current_user.food -= (time_change * 100)
            @current_user.save
            redirect_to game_over_path unless @current_user.food > 0
        end
        session[:time] = Time.new
    end

    def remove_log_from_session
        session[:new_log] = false
    end
end
