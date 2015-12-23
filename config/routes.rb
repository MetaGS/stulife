Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  get '/', to: "pages#country"

  scope "(:locale)", locale: /en|cn|my/ do
    devise_for :users, skip: :omniauth_callbacks, path: "/account"
    devise_for :admins, path: "/admin"

    post '/tinymce_assets' => 'tinymce_assets#create'

    scope ":country", country: /malaysia/ do
      root to: "pages#home"

      resources :universities, only: [:index, :show] do
        resources :courses, only: [:index, :show]
      end
    end

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
