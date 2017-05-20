



Rails.application.routes.draw do
  root to: 'tasklists#index'
  # get 'tasklists/index'
  # post 'tasklists/index', to: 'products#hogehoge'
  
  resources :tasklists
  
end
