Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: %i[new create edit update destroy] do
    resources :venues do
      resources :bookings, only: %i[new create destroy] do
        collection do
          get :history
        end
      end
    end
  end
end
