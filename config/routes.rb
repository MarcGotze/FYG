Rails.application.routes.draw do
  devise_for :users
  root to: "venues#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :venues, only: %i[index show]

  resources :users, only: %i[new create edit update destroy] do
    resources :venues, except: %i[index show] do
      resources :bookings, only: %i[new create destroy] do
        collection do
          get :history
        end
      end
    end
  end
end
