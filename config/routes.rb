Rails.application.routes.draw do

  resources :books
  get 'todolists/new'
   root 'root#top'

  post 'todolists' => 'todolists#create'


  get 'todolists' => 'todolists#index'


  get 'book/:id' => 'todolists#show'


end
