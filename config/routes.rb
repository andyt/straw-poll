Mysociety::Application.routes.draw do

  resources :voters
  resources :votes
  
  root :to => 'voters#new'

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

end
