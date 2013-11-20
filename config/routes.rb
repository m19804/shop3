Shop3::Application.routes.draw do

  get "payments/cancel"
  get "payments/success"
  get "payments/notify"
  get "payment/cancel"
  match "payments/success", via: [:get, :post]
  match "payments/notify", via: [:get, :post, :put]


  resources :item_users, only: [:index, :create, :destroy, :update]


  devise_for :users
  resources :comments, only: [:new, :create]

  resources :items


  resources :categories

  resources :posts
  resources :orders, only: [:index, :create, :show]

  get 'contacts' => 'about#contacts'



  #get "about/contacts"

  get "about" => 'about#contacts'


  root 'welcome#index'



end

