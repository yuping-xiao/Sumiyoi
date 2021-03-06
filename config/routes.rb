Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#top'
  get 'home/about'
  get "search" => "rooms#search"

  resources :rooms, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :room_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end
  
  resources :users, only: [:show, :edit, :update]
end
