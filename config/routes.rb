Rails.application.routes.draw do
  
  get 'posts', to: "posts#index", as: "posts"
  get 'posts/new', to: "posts#new", as: "new_post"
  get 'posts/:id', to: "posts#show", as: "post"
  get 'posts/:id/edit', to: "posts#edit", as: "edit_post"
  post 'posts', to: "posts#create"
  patch 'posts/:id', to: "posts#update"
  delete 'posts/:id', to: "posts#destroy"

  get 'destinations', to: "destinations#index", as: "destinations"
  get 'destinations/:id', to: "destinations#show", as: "destination"

  get 'bloggers', to: "bloggers#index", as: "bloggers"
  get 'bloggers/new', to: "bloggers#new", as: "new_blogger"
  get 'bloggers/:id', to: "bloggers#show", as: "blogger"
  get 'bloggers/:id/edit', to: "bloggers#edit", as: "edit_blogger"
  post 'bloggers', to: "bloggers#create"
  patch 'bloggers/:id', to: "bloggers#update"
  delete 'bloggers/:id', to: "bloggers#destroy"

  post 'posts/:id/like', to: "posts#like"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
