Rails.application.routes.draw do
  #  User authentication
  devise_for :users
  # Active Admin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Photos controller
  get 'photos/new',       to: 'photos#new',           as: 'photo_new'
  post 'photos',          to: 'photos#create',        as: 'photo_create'
  get 'photos/:id',       to: 'photos#show',          as: 'photo_detail'

  # Welcome index
  get 'welcome/index',    to: 'welcome#index',        as: 'welcome_home'

  # Users controller
  # get 'login',            to: 'users#login',          as: 'login'
  # post 'login',           to: 'users#new_session',    as: 'user_new_session'
  # get 'logout',           to: 'users#logout',         as: 'logout'

  root to: 'welcome#index'
end
