Rails.application.routes.draw do


  root 'users#new'

  post 'register' => 'users#create'
  post 'login' => 'users#login'
  delete 'sessions' => 'users#logout'

  get 'user/:id' => 'users#edit'
  patch 'user/:id' => 'users#update'
  delete 'user/:id' => 'users#destroy'

  get 'events' => 'events#index'
  get 'events/:id' => 'events#show'

  post 'events/:id' => 'events#create'
  get 'events/:id/edit' => 'events#edit'
  patch 'events/:id' => 'events#update'
  delete 'events/:id' => 'events#destroy'


  get 'events/:id/join' => 'joins#create'
  get 'events/:id/cancel' => 'joins#destroy'

  post 'comments' => 'comments#create'



end
