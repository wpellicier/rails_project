Rails.application.routes.draw do
  get 'students/new'
  get 'sessions/new'
  root 'pages#front'
  get '/about',               to: 'pages#about'
  
  get '/student_login',       to: 'sessions#student_login'
  post '/student_login',      to: 'sessions#new'
  get '/admin_login',         to: 'sessions#admin_login'
  post '/admin_login',        to: 'sessions#new'
  delete '/logout',           to: 'sessions#destroy'
  
  #get '/student_signup',      to: 'students#student_signup'
  #post '/student_signup',     to: 'students#new'
  get '/student_signup',      to: 'students#new'
  
  get '/student_home',        to: 'pages#student_home'
  get '/student_projects',    to: 'pages#student_projects'
  get '/student_evaluations', to: 'pages#student_evaluations'
  get '/admin_login',         to: 'pages#admin_login'
  get '/admin_home',          to: 'pages#admin_home'
  get '/admin_classes',       to: 'pages#admin_classes'
  get '/admin_class_home',    to: 'pages#admin_class_home'
  get '/admin_team_overview', to: 'pages#admin_team_overview'
  
  resources :students
end
