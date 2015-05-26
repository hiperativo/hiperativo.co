Rails.application.routes.draw do
    get "admin", to: "sessions#new"
    delete "admin", to: "sessions#destroy"
    resources :sessions, path: "admin"
    resources :products, path: "/"
    resources :files
end