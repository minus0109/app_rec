Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :gameasps
  resources :categories
  resources :radioactors

  root "radioactors#index"
end
