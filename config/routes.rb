Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :item_purchases, only:[:index, :create]
    resources :comments, only:[:create, :destroy]
  end
end
