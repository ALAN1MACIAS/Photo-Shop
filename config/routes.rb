Rails.application.routes.draw do
  # Active Admin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Photos controller
  get 'photos/:id', to: 'photos#show', as: 'photo_detail'

  # Welcome index
  get 'welcome/index', to: 'welcome#index', as: 'welcome_home'

  root to: 'welcome#index'
end
