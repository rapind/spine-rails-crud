BackboneRailsCrud::Application.routes.draw do

  # Authentication
  devise_for :administrators

  # Admin namespace
  namespace :admin do
    resources :administrators, :only => [:index, :new, :create]
    resources :articles
  end
  match 'admin' => 'admin/home#index'

  root :to => 'home#index'

end
