Rails.application.routes.draw do
  
  get '/sessions/new' => 'sessions#new'
  get '/sessions/create' => 'sessions#create'
  get '/sessions/destroy' => 'sessions#destroy'
  
  get "/greet" => "pages#homes"
  get "/sign_in" => 'pages#sign_in'
  get '/sign_out' =>'pages#sign_out'
  
  # CREATE
  get '/new_player' => 'players#new'
  get '/create_player' => 'players#create'

  # READ
  get '/players' => 'players#index'
  get '/players/:id' => 'players#show'

  # UPDATE
  get '/players/:id/edit' => 'players#edit'
  get '/players/:id/update' => 'players#update'

  # DELETE
  get '/players/:id/destroy' => 'players#destroy'
  #------------------------------
  get '/home' => 'home#home'
  get '/clubs' => 'clubs#clubs'
 
end 