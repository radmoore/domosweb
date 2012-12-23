Domosaics::Application.routes.draw do

  match '/download/' => 'users#download', :as => :download
  match '/download/:dtoken' => 'users#download', :as => :download
  match '/download/domosaics/:dtoken/:os' => 'users#download_file', :as => :download_file
  match '/users/resend_token' => 'users#resend_token'
  match '/users/thanks' => 'users#thanks'


  resources :users

  root :to => 'users#index'
end
