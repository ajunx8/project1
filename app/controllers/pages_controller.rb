class PagesController < ApplicationController
    def home
    end

    def game_over
        session[:time] = nil
    end

end
