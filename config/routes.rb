Rails.application.routes.draw do
  devise_for :users
  root "boards#index"

 resources :boards
 resources :lists do
   resources :tasks
 end
end
