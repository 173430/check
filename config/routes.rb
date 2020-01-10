Rails.application.routes.draw do

  resources :notepictures
  resources :groupmembers
  resources :groups
  get 'mypage/profile'
  patch 'mypage/profile'
  get 'mypage/edit'
  get 'mypage/passwordcheck'
  post 'mypage/passwordequal'
  patch 'mypage/passwordequal'

  get 'mypage/passwordedit'
  post 'mypage/editcheck'
  patch 'mypage/editcheck'

  get 'mypage/completed'

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
