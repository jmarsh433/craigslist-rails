Rails.application.routes.draw do

  root to: 'categories#index'

  resources :categories, only: [:index] do
    resources :articles
  end


end
