Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root "home#index"
  resources :messages
  resources :groups
  post '/home/search', to: 'home#search', as: :search
end
