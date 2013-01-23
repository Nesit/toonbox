Toonbox::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  scope '/about_us' do
    resources :jobs, only: [:index, :show]
    resources :persons, only: [:index, :show]
    resources :partners, only: [:index, :show]
    resource :contacts, only: :show
    resource :feedbacks, only: :show
  end

  resources :news, only: [:index, :show]
  resources :movies, only: [:show]

  root :to => 'portfolio#index'
end
