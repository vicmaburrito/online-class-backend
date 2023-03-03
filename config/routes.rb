Rails.application.routes.draw do
  get 'cities/index'
  get 'cities/show'
  get 'cities/new'
  get 'cities/edit'
  get 'cities/create'
  get 'cities/update'
  get 'cities/destroy'
  get 'teachers/index'
  get 'teachers/show'
  get 'teachers/new'
  get 'teachers/edit'
  get 'teachers/create'
  get 'teachers/update'
  get 'teachers/destroy'
  get 'schedules/index'
  get 'schedules/show'
  get 'schedules/new'
  get 'schedules/edit'
  get 'schedules/create'
  get 'schedules/update'
  get 'schedules/destroy'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/edit'
  get 'users/create'
  get 'users/update'
  get 'users/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
