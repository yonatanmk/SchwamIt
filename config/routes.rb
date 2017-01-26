Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  root "items#index"

  resources :items do
    resources :reviews, except: [:index, :show]
  end

  resources :users, only: [:index, :destroy]
end
