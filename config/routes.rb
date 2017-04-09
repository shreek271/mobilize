Rails.application.routes.draw do
  

  devise_for :users, controllers: { registrations: 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :products
  resources :brands
  resources :types
  resources :orders
  
  get 'home' => 'static_pages#home'
  get 'dashboard' => 'dashboard#show'
  root to: "static_pages#home"
end
