Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items do
    resources :reviews, except: [:index, :show]
  end
end
