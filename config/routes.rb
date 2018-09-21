Rails.application.routes.draw do

  resources :whines do
    resources :clarifiers
    resources :answers do
      member do
        put 'like', to: 'answers#upvote'
        put 'dislike', to: 'answers#downvote'
        put 'best', to: 'answers#toggle_best'
      end
    end
  end

  resources :whiners
  get 'login', to: 'sessions#new'
  resource :session, only: [:new, :create, :destroy]
  resources :search, only: [:index]

  root 'whines#index'

  namespace :api do
    namespace :v1 do
      resource :session, only: :create
      resources :whiners
      resources :whines do
        resources :clarifiers
        resources :answers
      end
    end
  end

end
