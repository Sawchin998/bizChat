Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :users do
    resources :messages
  end
  root "home#index"
  resources :messages
  resources :home
  resources :groups do
    resources :messages
  end
  post '/home/search', to: 'home#search', as: :search
end
