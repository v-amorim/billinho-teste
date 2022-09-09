Rails.application.routes.draw do
  namespace :api do
    resources :institutions, only: [:index]
  end
end
