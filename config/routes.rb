Rails.application.routes.draw do
  root :to => 'home#index'
  resource :shop, only: [:show]

  mount ShopifyApp::Engine, at: '/'
end
