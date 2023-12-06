Rails.application.routes.draw do
  root to: "pages#home"
  
  devise_for :users
  resources :cars

  get '/generate_data', 'cars#generate_data', controller: :cars, action: :generate_data
end