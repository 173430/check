Rails.application.routes.draw do

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'signup' => 'users#new'

  # For details on the DSL available within this file,see http://guides.rubyonrails.org/routing  .html
  resources :users, only: [:create]

  get 'chat/show'
  resources :notecomments
  resources :notes
  resources :answers
  resources :questions
  get 'questions/index'
  resources :users
  resources :classrooms
  resources :subjects
  resources :grades
  resources :schools
end
