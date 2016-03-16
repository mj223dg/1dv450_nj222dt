Rails.application.routes.draw do
  namespace :api, defaults: {format: "json"} do
    namespace :v1 do
      resources :schools, only: [:show, :create, :update, :destroy, :index] do
        resources :positions, only: [:index, :show]
        resources :tags, only: [:index, :show]
        resources :events, only: [:index, :show]
        resources :creators, only: [:index, :show]
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
