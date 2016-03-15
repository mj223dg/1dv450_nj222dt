Rails.application.routes.draw do
    namespace :api, defaults: {format: "json"} do
    namespace :v1 do
      resources :positions, only: [:index, :create, :show, :update, :destroy]
      resources :tags
      get "tag/specific" => "tags#show_specific_event"
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
