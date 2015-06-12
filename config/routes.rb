Rails.application.routes.draw do
  devise_for :users

  resources :campaigns

  root 'homepage#show'
end
