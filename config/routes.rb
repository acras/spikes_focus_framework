SpikesFocusFramework::Application.routes.draw do
  resources :categories

  root to: 'home#index'
  resources :products
end
