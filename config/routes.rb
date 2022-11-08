# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pairs#display'
  get 'pairs/manage' => 'pairs#manage'
  post 'pairs/create' => 'pairs#create'
  delete 'pairs/destroy/:id' => 'pairs#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
