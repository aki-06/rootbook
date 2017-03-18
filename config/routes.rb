Rails.application.routes.draw do

  get 'notifications/index'

  root 'top#index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :users, only:[:index]
  resources :relationships, only:[:create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :conversations do
    resources :messages
  end

  resources :topics do
    resources :comments

    collection do
      post :confirm
    end
  end
end
