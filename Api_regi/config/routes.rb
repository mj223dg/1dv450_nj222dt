Rails.application.routes.draw do
  mount Knock::Engine => "/knock"
  namespace :api, defaults: {format: "json"} do
    namespace :v1 do
      resources :schools, only: [:show, :create, :update, :destroy, :index] do
        resources :tags, only: [:index, :create]
      end
      
      resources :positions, only: [:show, :create, :update, :destroy, :index] do
        resources :schools, only: [:index, :show]
      end
      
      resources :tags, only: [:show, :create, :update, :destroy, :index] do
        resources :schools, only: [:index, :show]
      end
      
      resources :creators, only: [:show, :create, :update, :destroy, :index] do
        resources :schools, only: [:index, :show]
      end
      
    end
  end
  root  'home#index'
  get 'signup' => 'users#new'
  get 'create' => 'apis#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users do
    resources :apis
  end
end
