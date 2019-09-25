Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/bloggers', to: 'bloggers#index', as: 'bloggers'
  get '/bloggers/new', to: 'bloggers#new', as: 'new_blogger'
  get '/bloggers/:id', to: 'bloggers#show', as: 'blogger'
  post '/bloggers', to: 'bloggers#create'
  get '/bloggers/:id/edit', to: 'bloggers#edit', as: 'edit_blogger'
  patch '/bloggers/:id', to: 'bloggers#update'
  delete '/bloggers/:id', to: 'bloggers#destroy'

  resources :destinations, only: [:show]
  
  get '/posts', to: 'posts#index', as: 'posts'
  get '/posts/new', to: 'posts#new', as: 'new_post'
  get '/posts/:id', to: 'posts#show', as: 'post'
  post '/posts', to: 'posts#create'
  patch '/posts/:id', to: 'posts#like', as: 'like_post'
  
end
