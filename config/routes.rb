Teampage::Application.routes.draw do
  
  devise_for :admins
  resources :blogs do
    resources :pictures
  end

  resources :preparations

  resources :pictures

  resources :kinds

  resources :links

  root 'pages#home'

  get 'pages/home'
  get 'pages/pictures'

  get "contact/new"
  match 'contact' => 'contact#new', :via => :get
  match 'contact' => 'contact#create', :via => :post
  
end
