Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to:'portfolios#show', as: 'portfolio_show'
  get 'angular-items', to: 'portfolios#angular'
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs do
    member do
      post :toggle_status
    end
  end
  
  root to: 'pages#home'
end
