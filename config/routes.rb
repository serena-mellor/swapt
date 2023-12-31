Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")

  root "pages#landing"

  get '/home', to: 'pages#home'

  resources :items do
    resources :swaps, only: [:create, :update]
  end

  resources :swaps, only: [:show, :index]

  get '/received_swaps', to: 'swaps#received_swaps'



  resources :categories, only: :index

  get '/my_closet', to: 'users#my_closet'
  get '/my_outfits', to: 'users#my_outfits'
  get '/my_favourites', to: 'users#my_favourites'


  get '/closet/:user_id', to: 'users#closet', as: :closet

  resources :outfits, only: [:new, :create, :show, :index] do
    resources :favourites, only: :create
  end

  resources :favourites, only: :destroy
  # get '/outfitcreation', to: 'outfits#outfit_creation'

  get '/profile/:id', to: 'users#profile', as: :profile

  resources :categories, only: :index

  resources :chatrooms, only: [:index, :show] do
    resources :messages, only: :create
  end
end

# resources :items do
#   collection do
#     get 'search'
#   end
# end
