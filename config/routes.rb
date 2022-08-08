Rails.application.routes.draw do
  get "/search", to: "search#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "search#index"
end
