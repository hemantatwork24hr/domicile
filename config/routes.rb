Rails.application.routes.draw do
  
  get 'sessions/new'

  resources :customers
  resources :rooms do
      collection do
        get  :search
        post :new_search
        get  :show_search
        get  :search_by_room_type_id
      end

  end 
  resources :room_types
  resources :bookings
  resources :billings

  get 'welcome/index'

  # root 'welcome#index'
  root 'sessions#new'
  
  get 'login', to: 'sessions#new'
  
  delete 'logout', to: 'sessions#destroy'
  post 'login', to: 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
