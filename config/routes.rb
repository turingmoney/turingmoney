Rails.application.routes.draw do
  root 'home#index'
  resources :payments, :only => [:index]
  scope :format => true, :constraints => { :format => 'json' } do
    resources :projects
    resources :transactions, only: [:index]
    resource :book, only: [:show]
    resources :cards, only: [:create]
    resources :users do
      collection do
        put :support
        post :resend
      end
    end
    resource :sessions
  end
  get "*path", to: 'home#index'
  devise_for :users

end
