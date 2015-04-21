Rails.application.routes.draw do
 resources :songs
 resources :users, only: [:new, :show, :create]
 root 'songs#index'

 get     '/login', to: "sessions#new"
 post    '/login', to: "sessions#create"
 delete '/logout', to: "sessions#destroy"

 delete '/delete_all', to: "songs#all" 

end
