Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  root to: 'homes#top'
  get 'homes/about', to: 'homes#about', as: 'about'
  resources :users, only: [:index,:show,:update]
  resources :books, only: [:index,:show,:create,:destroy,:edit,:update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
