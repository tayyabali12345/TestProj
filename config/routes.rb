Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments, only: [:create, :show, :destroy]
  end
  root to: "posts#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :posts, except: [:new, :edit]
    end
  end
end
