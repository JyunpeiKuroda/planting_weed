Rails.application.routes.draw do
  get '/' => 'home#top'
  get "about" => "home#about"
  resources :posts do
    # get 'posts/index' => 'posts#index'
    # コメントやユーザーはここに入ってくる
  end
end
