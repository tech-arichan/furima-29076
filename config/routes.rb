Rails.application.routes.draw do
  get 'item_purchases/index'
  devise_for :users
  root to: "items#index"
  resources :items
  resources :item_purchases, only:[:index, :create]
end
