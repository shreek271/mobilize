Rails.application.routes.draw do
  

  devise_for :users, controllers: { registrations: 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'home' => 'static_pages#home'

  root to: "static_pages#home"
end
