Rails.application.routes.draw do
  root 'top#index'

  resources :topics
end
