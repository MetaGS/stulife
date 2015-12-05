Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  scope "(:locale)", locale: /en|cn|my/ do
    devise_for :users, skip: :omniauth_callbacks
    devise_for :admins, path: "/admin"

    root to: 'pages#home'
  end

  namespace :admin do
    root to: 'admin#dashboard'
  end
end
