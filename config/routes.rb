Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  get '/', to: "pages#landing"

  scope "(:locale)", locale: /en|cn|my/ do

    scope ":country", country: /malaysia/ do
      devise_for :users, skip: :omniauth_callbacks, path: "/account"

      root to: "pages#home"

      resources :universities, only: [:index, :show]

      post '/tinymce_assets' => 'tinymce_assets#create'
    end

    devise_for :admins, path: "/admin"

    namespace :admin do
      root to: 'admin#dashboard'

      put '/save_page_region', to: 'admin#save_page_region'

      resources :countries
      resources :universities do
        resources :courses
      end
      resources :images
    end
  end
end
