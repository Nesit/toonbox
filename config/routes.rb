Toonbox::Application.routes.draw do
  scope '/about_us' do
    resources :jobs, only: [:index, :show]
    resources :persons, only: [:index, :show]
    resources :partners, only: [:index, :show]
    resource :contacts, only: :show
    resource :feedbacks, only: :show
  end

  resources :news, only: [:index, :show]

  root :to => 'portfolio#index'
end
