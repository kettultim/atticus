Rails.application.routes.draw do
  devise_for :users

  resources :campaigns do
    resource :submission, only: [:create], controller: 'campaigns/submission'
    resource :launch, only: [:create], controller: 'campaigns/launch'
    resources :items, only: [:new, :create]
  end

  resource :dashboard, only: [:show], controller: 'dashboard'

  namespace :admin do
    resource :dashboard, only: [:show], controller: '/admin/dashboard'
    resources :campaigns do
      resource :approval, only: [:create],
               controller: '/admin/campaigns/approval'

      resource :rejection, only: [:create],
               controller: '/admin/campaigns/rejection'
    end
  end

  root 'homepage#show'
end
