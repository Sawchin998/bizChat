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
  
  post 'home/search', to: 'home#search', as: :search
  post 'groups/search', to: 'groups#search', as: :group_search
  get '/groups/:id/list_user', to: 'groups#list_user', as: :list_user
  post '/groups/:id/add_user', to: 'groups#add_user', as: :add_user_group
  delete '/groups/:id/remove_user', to: 'groups#remove_user', as: :remove_user_group

end
