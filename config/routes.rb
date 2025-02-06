Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  get "merch/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "cstrophy" => "cstrophy#index"
  # get "feedback" => "pages#feedback"
  # get "home" => "pages#home"
  # get "merch" => "merch#index"
  get 'products/export_sales', to: 'products#export_sales'

  delete 'products', to: 'products#destroy', as: 'delete_products'


  # Defines the root path route ("/")
  # root "posts#index"
  root "pages#home"
  get '/profile', to: 'pages#profile'
  post 'events/:id/start', to: 'events#start', as: :start
  post 'events/:id/end', to: 'events#end', as: :end
  resources :event_registrations
  resources :events
  resources :cstrophy
  resources :products
  resources :sales

  resources :products do
    collection do
      get :export_sales
    end
  end
  
end
