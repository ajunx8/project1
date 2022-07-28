Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :users, :only => [:new, :create, :index, :show, :update]
  
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  
  resources :planets, :only => [:index, :show, :new, :create]
  put '/planets/:id/extract' => 'planets#extract', :as => :extract_planet
  
  resources :moons, :only => [:show]
  put '/moons/:id/extract' => 'moons#extract', :as => :extract_moon
  
  get 'logs/new'
  get '/gameover' => 'pages#game_over', :as => :game_over
  
end
