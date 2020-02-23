Rails.application.routes.draw do
  root :to => 'home#index'
  resources :shop, only: [:show, :update], defaults: { format: :json }

  mount ShopifyApp::Engine, at: '/'
end
