Rails.application.routes.draw do
  
  resources :contacts
  get  '/about'     => 'pages#about'
  root 'pages#home'

end
