# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#top'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users
end
