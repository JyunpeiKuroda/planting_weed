Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  get '/home' => 'home#top'
  # get "about" => "home#about"
  resources :posts do
    resources :users, only: [:show]
  end
end
