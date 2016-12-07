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
    end
  end

  get "pages/test"

  root to: "projects#index"
end
