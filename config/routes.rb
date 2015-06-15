Knowyourbackyard::Application.routes.draw do
  resources :video_submissions
  resources :resolvedreviewdisputes
  resources :resolvedrevisiondisputes
  resources :revisiondisputes
  resources :revisionreviews
  resources :reviewdisputes
  resources :sponsors
  resources :messages, only: [:new, :create, :destroy]
  resources :contact_mails, only: [:new, :create]
  resources :chats, only: [:index, :show, :new, :destroy]
  resources :contacts
  resources :users, only: [:show,:edit,:update], path: 'user/profile'
  get '/users', to: 'users#index', as: 'index'
  get '/topusers', to: 'users#clockuser', as: 'clockuser'
  resources :ratings, only: [:new,:create,:destory]
  resources :trailupdates, only: [:new, :create, :destroy]
  resources :comments, only: [:new, :create, :destroy]
  resources :trails
  resources :reviews
  resources :revisions
  resources :notifications, only: :destroy
  resources :videos, only: [:new, :create, :destroy]
  get "Trailreview", to: 'trailblazer_lists#trailsreview', as: 'trailreviewindex'
  get "Trailslist", to: 'trails#trailslist', as: 'trailsindex'
  get "GuestTrailslist", to: 'pages#guestviewtrail', as: 'guestindex'
  patch "Promoteadmin", to: 'actions#promote_to_admin', as: 'adminpromote'
  patch "PromoteTrailblazer", to: 'actions#promote_to_trailblazer', as: 'trailblazerpromote'
  patch "Demoteadmin", to: 'actions#demote_from_admin', as: 'admindemote'
  get "AccpetRevision", to: 'actions#set_trail_to_revision', as: 'setrevision'
  devise_for :users
  root to: 'pages#home'
  
  get 'TrailSearch', to: 'pages#searchtrails', as: 'search'
  get 'TrailResults', to: 'pages#searchresults', as: 'results'
  get 'AboutUs', to: 'pages#about', as: 'about'
  get 'HowtoSponsor', to: 'pages#howtosponsor', as: 'howsponsor'

  
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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
