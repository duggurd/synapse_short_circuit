Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "base#index"

  get "/about", to: "base#about"
  get "/contact", to: "base#contact"

  resources :projects, only: [:index, :show]
  resources :publications, only: [:index, :show]
  
  #Projects admin
  scope shallow_path: "fx5f3jnfwmcsvot4ttqp" do
    resources :tags, controller: "tags", only: [:edit, :show, :update], shallow: true

    get "fx5f3jnfwmcsvot4ttqp/tags/new", to: "tags#new"
    post "fx5f3jnfwmcsvot4ttqp/tags/:id", to: "tags#create"
    get "fx5f3jnfwmcsvot4ttqp/tags/:id/destroy", to: "tags#destroy"

    get "fx5f3jnfwmcsvot4ttqp/:project_name/destroy", to: "admin#destroy"
    resources :fx5f3jnfwmcsvot4ttqp, controller: "admin", as: :admin
  end

  #Publications admin
  scope shallow_path: "jauxe8sq0yvpcuukt6bf" do
    resources :tags, controller: "tags", only: [:edit, :show, :update], shallow: true

    get "jauxe8sq0yvpcuukt6bf", to: "admin#index"
    get "jauxe8sq0yvpcuukt6bf/tags/new", to: "tags#new"
    post "jauxe8sq0yvpcuukt6bf/tags/:id", to: "tags#create"
    get "jauxe8sq0yvpcuukt6bf/tags/:id/destroy", to: "tags#destroy"

    get "jauxe8sq0yvpcuukt6bf/:publication_name/destroy", to: "adminpublications#destroy"
    resources :jauxe8sq0yvpcuukt6bf, controller: "adminpublications", as: :adminpub
  end

  # get "/fx5f3jnfwmcsvot4ttqp/verify", to: "admin#verify"

  resources :projects, only: [:index, :show]

  match "*a", to: "projects#routing_error", via: [:get, :put, :post, :delete]


end
