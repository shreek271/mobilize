Rails.application.routes.draw do
  

  devise_for :users, controllers: { registrations: 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :products
  resources :brands
  resources :types
  resources :orders do
    patch :update_status
  end
  
  get 'home' => 'static_pages#home'
  get 'dashboard' => 'dashboard#show'
  get 'opinion' => "static_pages#opinion"
  root to: "static_pages#home"
end
