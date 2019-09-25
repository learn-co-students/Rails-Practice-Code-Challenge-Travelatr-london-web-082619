Rails.application.routes.draw do

  resources :posts, only: [:index, :new, :show, :create, :edit, :update]
  resources :bloggers , only: [:index, :new, :create, :show]
  resources :destinations, only: [:index, :show]

  get '/posts/:id/like', to: "posts#like", as: 'like'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
