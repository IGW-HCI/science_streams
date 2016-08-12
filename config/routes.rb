# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  devise_for :users

  resources :projects do
    member do
      get :contributions
    end
  end

  root to: "projects#index"
end
