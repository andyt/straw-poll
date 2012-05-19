Mysociety::Application.routes.draw do

  resources :voters

  resource :votes
  
  root :to => 'votes#new'

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

end
