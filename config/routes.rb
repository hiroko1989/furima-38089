Rails.application.routes.draw do

  #rails g devise userでmigrationとともに自動生成
  devise_for :users
  
  root "items#index"
  resources :items do
    resources :orders, only: [:index, :create]
   end
end
