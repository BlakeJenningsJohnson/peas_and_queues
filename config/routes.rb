require 'resque/server'
PeasAndQueues::Application.routes.draw do

  mount Resque::Server, :at => "/resque"
  
  root  'welcome#index'
  match '/auth/:provider/callback',  to: 'sessions#create', via: [:get, :post]
  get   '/signout',                   to: 'sessions#destroy'

  get   '/users',                    to: 'users#show'
  
  get   '/posts/new',                to: 'posts#new',     as: :new_post
  post  '/posts',                    to: 'posts#create'
  get   '/posts',                    to: 'posts#index', as: :all_posts
  get    '/posts/:id',               to: 'post#show', as: :post

  get   '/events',                   to: 'events#index'
  get   '/events/new',               to: 'events#new', as: :new_event
  post  '/events',                   to: 'events#create'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
