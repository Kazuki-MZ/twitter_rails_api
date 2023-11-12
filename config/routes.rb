# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'users', controllers: {
        registrations: 'api/v1/auth/registrations'
      }
      namespace :auth do
        resources :sessions, only: %i[index]
      end

      resources :users, only: %i[show]
      resources :tweets, only: %i[index show create destroy]
      resources :tweet_images, path: 'images', only: %i[create]
      resource :profile, only: %i[update]
    end
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
