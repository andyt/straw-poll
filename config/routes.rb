Mysociety::Application.routes.draw do

  resources :constituencies
  resources :voters
  resources :votes
  
  root :to => 'home#index'

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

end
