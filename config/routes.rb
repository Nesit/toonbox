Toonbox::Application.routes.draw do

  mount Ckeditor::Engine => "/ckeditor"

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
    resources :jobs, only: [:index, :show] do
      post :create_request, on: :member
    end
    resources :persons, only: [:index, :show]
    resources :partners, only: :index
    resources :prizes, only: :index
    resources :feedbacks, only: :index
    resource :contacts, only: :show
    resource :about

    root :to => 'about#index', as: "about_us"
  end

  resources :news, only: [:index, :show]
  resources :movies, only: [:show] do
    resources :episodes, only: :show
  end

  root :to => 'portfolio#index'
end