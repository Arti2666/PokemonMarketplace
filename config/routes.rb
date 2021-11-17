Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :pokemons do
    resources :bookings, only: %I[new create]
  end
  resources :profiles, only: %I[show] do
    collection do         # on cree une route sans id
      get :my_profile
    end
  end
end
