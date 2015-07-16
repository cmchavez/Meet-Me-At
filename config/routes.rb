Rails.application.routes.draw do
  get 'email_invitations/new'

  get 'email_invitations/create'

  resources :email_invitations
  resources :meetings
  resources :friendships
  # resources :searches

  get "searches" => "searches#index", as: :searches
  get "searches/new" => "searches#new", as: :new_search
  get "searches/show" => "searches#show", as: :show_search


  # get "meetings" => "meetings#index", as: :meetings
  # get "meetings/new" => "meetings#new", as: :new_meeting
  # post "meetings/new" => "meetings#create", as: :create_meeting
  # get "meetings/id" => "meetings#show", as: :show_meething
  # get "/meetings/:id/edit" => "meetings#edit", as: :edit_meeting
  
  # patch "meetings/show" => "meetings#update", as: :update_meeting
  # delete "meeting/:id" => "meetings#destroy", as: :destroy_meeting



  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks"}

  root 'users#show'
  get "users" => "users#index", as: :users
  get "users/:id" => "users#show", as: :user

    resources :invites do
    resources :messages
  end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
