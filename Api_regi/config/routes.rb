Rails.application.routes.draw do
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
