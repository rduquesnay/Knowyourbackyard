Knowyourbackyard::Application.routes.draw do
  resources :advertisers
  resources :socials, only: [:new, :create, :edit, :update, :destroy]
  resources :videomaker_submissions
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
  resources :ratings, only: [:new,:create,:destroy]
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
  patch "DemoteTrailblazer", to: 'actions#demote_from_trailblazer', as: 'trailblazerdemote'
  patch "Demoteadmin", to: 'actions#demote_from_admin', as: 'admindemote'
  get "AccpetRevision", to: 'actions#set_trail_to_revision', as: 'setrevision'
  patch "ToggleTrailGuestView", to: 'actions#toggle_trail_viewablebyguest', as: 'toggleview'
  devise_for :users
  root to: 'pages#home'
  
  get 'TrailSearch', to: 'pages#searchtrails', as: 'search'
  get 'TrailResults', to: 'pages#searchresults', as: 'results'
  get 'AboutUs', to: 'pages#about', as: 'about'
  get 'FAQ', to: 'pages#faq', as: 'faq'
  get 'E-Mag', to: 'pages#emag', as: 'emag'
  get 'HowtoSponsor', to: 'pages#howtosponsor', as: 'howsponsor'

end
