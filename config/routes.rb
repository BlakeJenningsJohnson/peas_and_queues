require 'resque/server'
PeasAndQueues::Application.routes.draw do
  mount Resque::Server, :at => "/resque"

  root  'welcome#index'

  match '/auth/:provider/callback',  to: 'sessions#create', via: [:get, :post], as: :sign_in
  get   '/signout',                  to: 'sessions#destroy'

  get   '/users',                    to: 'users#show', as: :user_show
  get   '/users/:id/profile',        to: 'users#edit', as: :profile
  patch '/users/:id/profile',        to: 'users#update', as: :user

  match '/auth/:provider/callback',  to: 'sessions#create', via: [:get, :post]
  get   '/signout',                  to: 'sessions#destroy'
  
  get   '/posts/new',                to: 'posts#new',     as: :new_post
  post  '/posts',                    to: 'posts#create'
  get   '/posts',                    to: 'posts#index', as: :all_posts
  get   '/posts/:id',                to: 'posts#show', as: :post
  post  '/posts/comment',            to: 'comments#create', as: :post_comments

  get   '/events',                   to: 'events#index'
  get   '/events/new',               to: 'events#new', as: :new_event
  post  '/events',                   to: 'events#create'
  get   '/events/rsvp/:id',          to: 'events#rsvp', as: :rsvp
  get   '/events/:id/edit',          to: 'events#edit', as: :edit
  get   '/events/:id',                to: 'events#show', as: :event_show
  patch '/events/:id',               to: 'events#update', as: :event

  get   '/tools/new',                to: 'tools#new',     as: :new_tool
  post  '/tools',                    to: 'tools#create'
  get   '/tools',                    to: 'tools#index', as: :all_tools
  get   '/tools/:id',                to: 'tools#show', as: :tool
  patch '/tools/rent/:id',           to: 'tools#rent', as: :rent
  patch '/tools/return/:id',         to: 'tools#return', as: :return
  post  '/waitlist',                 to: 'waitlists#create', as: :waitlists

  get   '/weather_update',           to: 'welcome#weather_report'
end
