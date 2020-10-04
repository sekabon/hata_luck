Rails.application.routes.draw do
  
  root to: "shifts#index"
  devise_for :users
  resources :users, only: [:new, :destroy, :edit]
  resources :shifts, only: [:index, :create, :show, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
