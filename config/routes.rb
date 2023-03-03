Rails.application.routes.draw do

  resources :users, only: [:index, :show, :create, :update, :destroy]
  resources :schedules, only: [:index, :show, :create, :update, :destroy]
  resources :teachers, only: [:index, :show, :create, :update, :destroy]
  resources :cities, only: [:index, :show, :create, :update, :destroy]
  resources :classes, only: [:index, :show, :create, :update, :destroy]
  resources :enrollments, only: [:index, :show, :create, :update, :destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
