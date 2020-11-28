Rails.application.routes.draw do
  devise_for :members
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :posts do
    member do
      get "publish"
      get "unpublish"
    end

  end
end
