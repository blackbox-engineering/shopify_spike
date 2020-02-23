Rails.application.routes.draw do
  root :to => 'home#index'
  resource :shop, only: [:show], defaults: { format: :json }

  mount ShopifyApp::Engine, at: '/'
end
