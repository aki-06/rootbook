Rails.application.routes.draw do
  root 'top#index'

  resources :topics, only:[:index, :new, :create, :edit, :update, :destroy]
end
