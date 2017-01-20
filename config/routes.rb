Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root "items#index"
  resources :items do
    resources :reviews, except: [:index, :show] do
      post '/up_vote' => 'votes#up_vote', as: :up_vote
      post '/down_vote' => 'votes#down_vote', as: :down_vote
    end
  end
end
