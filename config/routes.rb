Rails.application.routes.draw do
  
  resources :products do
    resources :comments
  end
  resources :users

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}, :controllers => { :registration => "registrations" }
  
  devise_for :users,
  :skip => [:registrations, :sessions]


  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'

	get 'static_pages/landing_page'

	get 'orders/index'

	post 'static_pages/thank_you'

  root 'products#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :orders, only: [:index, :show, :create, :destroy]

end
