Rails.application.routes.draw do
  root 'home#top'
  get 'terms', to: 'home#terms'
  get 'privacy', to: 'home#privacy'
  get 'about', to: 'home#about'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords',
    :confirmations => 'users/confirmations',
    :unlocks => 'users/unlocks',
  }

  devise_scope :user do
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    delete "logout", :to => "users/sessions#destroy"
  end


  resource :users, only: [:show] do
    collection do
      #マイページ
      get "mypage", :to => "users#mypage"
      #パスワード
      get "mypage/edit_password", :to =>"users#edit_password"
      put "mypage/password", :to => "users#update_password"
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
