Rails.application.routes.draw do
  root "pages#home"
  devise_for :users,path:'',
  path_names: {sign_in: 'login',sign_up: 'registration',sign_out: 'logout'},
  controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users,only: [:show]
  resources :rooms, except: [:edit] do
    member do
      get 'listing'
      get 'pricing'
      get 'description'
      get 'photo_upload'
      get 'amenities'
      get 'location'
      get 'preload'
      get 'preview'
    end
    resources :photos, only: [:create, :destroy]
    resources :reservations, only: [:create]

  end

  get 'your_trips', to:'reservations#your_trips'
  get 'your_reservations', to: 'reservations#your_reservations'
end
