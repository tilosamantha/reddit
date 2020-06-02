Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'subs#index'

  resources :subs do
    resources :topics   #these resources have no correlation with each other unless you make them related somehow
  
    # '/subs/:sub_id/topics'
    # /subs/1/topics
  end

  resources :topics do
    resources :comments
  end

  # resources :pictures

  #http verb 'url pattern', to: 'controller#action'
    # :id   placeholder for id
    # get '/people', to: 'people#index'
    # "/subs/3"
end
