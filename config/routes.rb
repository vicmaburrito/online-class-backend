Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :users
  post '/auth/login', to: 'authentication#login'

  resources :schedules, only: [:index, :show, :create, :update, :destroy]
  resources :courses, only: [:index, :show, :create, :update, :destroy]
  resources :enrollments, only: [:index, :show, :create, :update, :destroy]

namespace :api do
  namespace :v1 do
    resources :courses, only: [:index, :show, :create, :update, :destroy]
    resources :cities, only: [:index, :show, :create, :update, :destroy]
    resources :teachers, only: [:index, :show, :create, :update, :destroy]
  end
end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
