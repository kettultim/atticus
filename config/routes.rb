Rails.application.routes.draw do
  devise_for :users

  resources :campaigns

  namespace :admin do
    resource :dashboard, only: [:show], controller: '/admin/dashboard'
    resources :campaigns do
      resource :approval, only: [:create], controller: '/admin/campaigns/approval'
      resource :rejection, only: [:create], controller: '/admin/campaigns/rejection'
    end
  end

  root 'homepage#show'
end
