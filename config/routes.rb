Rails.application.routes.draw do
  
  root to: 'visitors#index'

  #get "visitors/index" => "visitors#index"
  get "dashboard/realTime" => "dashboard#realTime"
  get "dashboard/history" => "dashboard#history"
  get "services/services" => "services#services"

  #devise_for :users
  
  devise_for :users, controllers: { sessions: "users/sessions" }
  resources :users
  
end
