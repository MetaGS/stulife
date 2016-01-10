Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  get '/', to: "pages#country", as: :landing

  scope "(:locale)", locale: /en|cn|my/ do
    devise_for :users, skip: :omniauth_callbacks, path: "/account"
    devise_for :admins, path: "/admin"

    post '/tinymce_assets' => 'tinymce_assets#create'

    scope ":country", country: /malaysia/ do
      root to: "pages#home"

      resources :universities, only: [:index, :show] do
        resources :courses, only: [:index, :show]
      end

      resources :houses do
        resources :house_units do
          post :show
        end
      end

      resources :car_vendors, path: "/cars" do

      end
    end

    namespace :admin do
      root to: 'admin#dashboard'

      post '/save_page_region', to: 'admin#save_page_region'

      resources :countries
      resources :study_fields do
        member do
          get 'edit_field_levels'
          put 'update_field_levels'
        end
      end
      resources :universities do
        resources :courses
      end
      resources :images
      resources :houses do
        resources :house_units
      end
      resources :car_vendors do
        resources :cars
      end
    end
  end
end
