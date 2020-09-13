Rails.application.routes.draw do
  get 'about', to: 'pages#about'

  resources :posts do
    resources :comments
  end

  root to: 'posts#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
