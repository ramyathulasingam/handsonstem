Rails.application.routes.draw do
  get 'users/create'

  get 'home/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: 'workshops#index'

  get 'workshops/get_data'

  post 'workshops/import'

  
  match "/auth/eventbrite/callback", :to => 'auth#eventbriteCallback', :via => [:get], :as => 'eventbrite_callback'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get '/auth/eventbrite', to: redirect('https://www.eventbrite.com/oauth/authorize?response_type=code&client_id=LM35T2HNQKLMFV5WVQ')
  
  get '/auth/eventbrite/callback', to: redirect('https://www.eventbrite.com/oauth/authorize?response_type=code&client_id=LM35T2HNQKLMFV5WVQ')  
  
  get 'login/login'
  
  resources :workshops
  resources :users
  
end
