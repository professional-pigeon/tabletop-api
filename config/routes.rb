Rails.application.routes.draw do
  namespace :api do 
    resources :users, only: %i[create destroy index]
    post '/auth/login', to: 'authentication#login'
    post '/auth/logout', to: 'authentication#logout'
    resources :campaigns, only: %i[create show update destroy]
    get '/user/campaigns', to: 'campaigns#index'
    resources :locations, only: %i[create show update destroy]
    get '/campaign/locations/:campaign_id', to: 'locations#index'
    resources :characters, only: %i[index create show update destroy]
  end
end