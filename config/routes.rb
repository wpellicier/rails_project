Rails.application.routes.draw do
  root 'pages#front'
  get '/about',               to: 'pages#about'
  get '/student_login',       to: 'pages#student_login'
  get '/student_home',        to: 'pages#student_home'
  get '/student_projects',    to: 'pages#student_projects'
  get '/student_evaluations', to: 'pages#student_evaluations'
  get '/admin_login',         to: 'pages#admin_login'
  get '/admin_home',          to: 'pages#admin_home'
  get '/admin_classes',       to: 'pages#admin_classes'
  get '/admin_class_home',    to: 'pages#admin_class_home'
  get '/admin_team_overview', to: 'pages#admin_team_overview'
end
