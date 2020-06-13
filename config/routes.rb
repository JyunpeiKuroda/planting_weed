Rails.application.routes.draw do
  # get '/' => 'home#top'
  # get "about" => "home#about"
  root 'posts#index'
  resources :posts
    # コメントやユーザーはここに入ってくる
end
