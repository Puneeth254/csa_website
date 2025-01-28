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
  get "cstrophy" => "cstrophy#index"
  get "feedback" => "pages#feedback"
  get "home" => "pages#home"
  get "merch" => "merch#index"
  get 'merch/export_sales', to: 'merch#export_sales', as: 'export_sales_merch'

  delete 'merch', to: 'merch#destroy', as: 'delete_merch'


  # Defines the root path route ("/")
  # root "posts#index"
  root "pages#home"
  get '/profile', to: 'pages#profile'
  post 'events/:id/start', to: 'events#start', as: :start
  post 'events/:id/end', to: 'events#end', as: :end
  resources :event_registrations
  resources :events
  resources :cstrophy
  resources :merch, only: [:index, :create, :destroy]
  resources :sales, only: [:create]

  resources :merch do
    collection do
      get :export_sales
    end
  end
  
end
