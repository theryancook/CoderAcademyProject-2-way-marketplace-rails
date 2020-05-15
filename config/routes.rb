Rails.application.routes.draw do
  devise_for :users

  get "/about", to: "pages#home", as: "about"

  get "/payment", to: "pages#payment", as: "payment"

  get "/", to: "listings#index", as: "root"

  get "/listings/new", to: "listings#new", as: "new_listing"

  post "/listings", to: "listings#create"

  get "/listings/:id", to: "listings#show", as: "listing"

  get "/listings/:id/edit", to: "listings#edit", as: "edit_listing"

  put "/listings/:id", to: "listings#update"

  patch "/listings/:id", to: "listings#update"

  delete "/listings/:id", to: "listings#destroy"

end
