ActionController::Routing::Routes.draw do |map|
  resources :posts
  resources :users do
    resources :posts
  end
end
