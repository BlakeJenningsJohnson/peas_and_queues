require 'resque/server'
PeasAndQueues::Application.routes.draw do
  mount Resque::Server, :at => "/resque"
  
  root  'welcome#index'
  match '/auth/:provider/callback',   to: 'sessions#create', via: [:get, :post]
  get   '/signout',                   to: 'sessions#destroy'

  get   '/users',                     to: 'users#show'
  get   '/users/:id/profile',         to: 'users#edit', as: :profile
  patch '/users/:id/profile',         to: 'users#update', as: :user

  
  get   '/posts/new',                 to: 'posts#new',     as: :new_post
  post  '/posts',                     to: 'posts#create'
  get   '/posts',                     to: 'posts#index', as: :all_posts
  get    '/posts/:id',                to: 'post#show', as: :post

  get   '/events',                    to: 'events#index'
  get   '/events/new',                to: 'events#new', as: :new_event
  post  '/events',                    to: 'events#create'
  get   '/events/rsvp/:event',        to: 'events#rsvp', as: :rsvp
  get   '/events/:id/edit',           to: 'events#edit', as: :edit
  patch '/events/:id',                to: 'events#update', as: :event

end
