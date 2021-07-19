Rails.application.routes.draw do
  resources :student_goals
  resources :goals
  resources :students
  resources :teachers

  post '/login', to:"teachers#login"
  get '/me', to: 'teachers#me'

end
