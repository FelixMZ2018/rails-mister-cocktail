Rails.application.routes.draw do
  resources :cocktails
  resources :doses

  resources :cocktails do
    resources :doses, only: [ :create, :new  ] #collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
