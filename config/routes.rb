Rails.application.routes.draw do
  devise_for :users
  devise_for :admins, path: "/admin"

  root to: 'pages#home'

  namespace :admin do
    root to: 'admin#dashboard'
  end
end
