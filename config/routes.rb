Rails.application.routes.draw do
  #Blogger
  get "bloggers/new", to: "bloggers#new", as: "new_blogger"
  get "bloggers/:id", to: "bloggers#show", as: "blogger"
  post "bloggers", to: "bloggers#create"


  #Destination
  get "destinations/:id", to: "destinations#show", as: "destination"

  #Post
  get "posts/new", to: "posts#new", as: "new_post"
  get "posts/:id", to: "posts#show", as: "post"
  get "posts/:id/edit", to: "posts#edit", as: "edit_post"
  post "posts", to: "posts#create"
  patch "posts/:id", to: "posts#update"
  patch "posts/:id/like", to: "posts#like" 
  
end
