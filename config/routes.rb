Rails.application.routes.draw do
  devise_for :users
  root to: 'welcome#show'
  resources :movies do
    patch :publish, on: :member
  end
end
