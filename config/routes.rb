Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'users/is'
    end
  end
  #  User authentication
  devise_for :users
  # Active Admin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Photos controller
  get 'photos/my_photos', to: 'photos#my_photos',   as: 'my_photos'
  resources :photos

  # Welcome index
  get 'welcome/index',    to: 'welcome#index',      as: 'welcome_home'

  # API
  namespace :api do
    namespace :v1 do
      resources :users, expect: %i[new edit]
      resources :photos, expect: %i[new edit]
    end
  end

  # Users controller
  # get 'login',            to: 'users#login',          as: 'login'
  # post 'login',           to: 'users#new_session',    as: 'user_new_session'
  # get 'logout',           to: 'users#logout',         as: 'logout'

  root to: 'welcome#index'
end
