# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "auth/login"
    end
  end

  devise_for :users

  resources :projects do
    member do
      get :contributions
      get :manage_users
      post :manage_users, to: "projects#add_and_remove_users"
      namespace :contribution do
        resources :images, only: [:new, :create, :update]
        resources :texts,  only: [:new, :create, :update]
      end
      # resources :contribution_images, as: :images, only: [:new, :create, :update], path: :images
      # resources :contribution_texts,  as: :text,   only: [:new, :create, :update], path: :text
    end
  end

  get "pages/test"

  root to: "projects#index"
end
