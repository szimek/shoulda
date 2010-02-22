ActionController::Routing::Routes.draw do |map|
  resources :users do
    resources :posts
  end

  resources :posts
end
