Rails.application.routes.draw do
  get '/' => 'home#top'
  get "about" => "home#about"
  resources :posts
    # コメントやユーザーはここに入ってくる
end
