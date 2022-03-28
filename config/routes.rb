Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#home'
  get '/search' => 'users#search', :as => 'search_page'
  get "profile/:id"=> "users#profile",  as:  :profile
  resources :posts, only: [:new, :create, :show , :destroy]
end
