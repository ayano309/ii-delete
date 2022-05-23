Rails.application.routes.draw do
  root 'home#top'
  get 'terms', to: 'home#terms'
  get 'privacy', to: 'home#privacy'
  get 'shop', to: 'home#shop'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
