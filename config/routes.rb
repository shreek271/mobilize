Rails.application.routes.draw do
  

  devise_for :users, controllers: { registrations: 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :products do
    resources :images
  end
  resources :offers
  resources :brands
  resources :users
  resources :types
  resources :orders do
    patch :update_status
  end
  
  get 'home' => 'static_pages#home'
  get 'accessories' => "brands#accessory"
  get 'dashboard' => 'dashboard#show'
  get 'opinion' => "static_pages#opinion"
  root to: "static_pages#home"
end
