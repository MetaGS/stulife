Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  scope "(:locale)", locale: /en|cn|my/ do
    devise_for :users, skip: :omniauth_callbacks, path: "/"
    devise_for :admins, path: "/admin"

    root to: 'pages#home'

    post '/tinymce_assets' => 'tinymce_assets#create'

    namespace :admin do
      root to: 'admin#dashboard'

      resources :countries
      resources :universities do
        resources :courses
      end
      resources :images
    end
  end
end
