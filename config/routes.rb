Rails.application.routes.draw do
  devise_for :users
  root 'top#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :topics, only:[:index, :new, :create, :edit, :update, :destroy] do
    collection do
      post :confirm
    end
  end
end
