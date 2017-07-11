Rails.application.routes.draw do
  
  resources :customers
  resources :rooms do
      collection do
        get  :search
        post  :new_search
        get  :show_search
      end

  end 
  resources :room_types
  resources :bookings

  get 'welcome/index'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
