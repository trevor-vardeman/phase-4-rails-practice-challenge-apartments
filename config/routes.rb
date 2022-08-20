Rails.application.routes.draw do
  resources :apartment
  resources :tenant
  resources :lease, only: [:create, :destroy]
end
