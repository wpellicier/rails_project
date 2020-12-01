Rails.application.routes.draw do
  get 'students/new'
  get 'sessions/new'
  root 'pages#front'
  get '/about',               to: 'pages#about'
  
  get '/student_login',       to: 'sessions#new'
  post '/student_login',      to: 'sessions#create'
  get '/admin_login',         to: 'sessions#admin_login'
  post '/admin_login',        to: 'pages#admin_team_overview'
  delete '/logout',           to: 'sessions#destroy'


  put '/students',                to: 'pages#admin_team_overview'
  
  
  get '/student_signup',      to: 'students#new'
  
  get '/student_home',        to: 'pages#student_home'
  get '/student_projects',    to: 'pages#student_projects'
  get '/student_evaluations', to: 'pages#student_evaluations'
  get '/admin_login',         to: 'pages#admin_login'
  get '/admin_home',          to: 'pages#admin_home'
  get '/admin_classes',       to: 'pages#admin_classes'
  get '/admin_class_home',    to: 'pages#admin_class_home'
  get '/admin_team_overview', to: 'pages#admin_team_overview'
  
  
  get '/student_rating',        to: 'students#rating'

  resources :students
  resources :edit
end
