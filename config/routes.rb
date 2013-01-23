Toonbox::Application.routes.draw do
  # Admin panel
  namespace :admin do
    resources :movies do
      post :add_image, on: :member
      delete :destroy_image, on: :collection
      put :image_as_default
    end
    resources :movie_episodes do
      post :add_image, on: :member
      delete :destroy_image, on: :collection
      put :image_as_default
    end
  end

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
