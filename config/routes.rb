Rails.application.routes.draw do
  devise_for :users

  resources :campaigns

  namespace :admin do
    resource :dashboard, only: [:show], controller: '/admin/dashboard'
    resources :campaigns
  end

  root 'homepage#show'
end
