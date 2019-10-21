Rails.application.routes.draw do
  resources :notecomments
  resources :notes
  resources :answers
  resources :questions
  resources :users
  resources :classrooms
  resources :subjects
  resources :grades
  resources :schools
end
