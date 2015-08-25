Rails.application.routes.draw do
  
  devise_for :users
  resources :contacts
  get  '/about'     => 'pages#about'
  root 'pages#home'

end
