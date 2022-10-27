Rails.application.routes.draw do
  root 'pairs#display'
  get 'pairs/manage' => 'pairs#manage'
  post 'pairs/create' => 'pairs#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
