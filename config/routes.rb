Rails.application.routes.draw do
  devise_for :users
  root 'top#index'

  resources :topics, only:[:index, :new, :create, :edit, :update, :destroy] do
    collection do
      post :confirm
    end
  end
end
