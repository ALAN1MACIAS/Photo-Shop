Rails.application.routes.draw do

  scope '(:locale)' do
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
        resources :users, expect: %i[new edit index]
        resources :photos, expect: %i[new edit]
      end
    end

    root to: 'welcome#index'
  end
end
