Rails.application.routes.draw do
  resources :answers
  resources :questions
  resources :users
  resources :classrooms
  resources :subjects
  resources :grades
  resources :schools
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
