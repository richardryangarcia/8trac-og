Rails.application.routes.draw do

  root to: "orders#index"

  devise_for :users, controllers: {
      confirmations: 'users/confirmations',
      omniauthable: 'users/omniauthable',
      passwords: 'users/passwords',
      registrations: 'users/registrations',
      sessions: 'users/sessions',
      unlocks: 'users/unlocks'
  }
  resources :brokers
  resources :user_brokers

  get 'users_custom/index' => 'users_custom#index', :as => :users_custom_path
  match 'orders/index' => 'orders#index', :as => :orders_path, via: [:get,:post]
  match 'instruments/test_remote' => 'instruments#test_remote', :as => :instruments_test_remote, via: [:get,:post]
  match "orders/add_order_comment" => "orders#add_order_comment", as: :orders_add_comment, via: [:get, :post]
  match "orders/add_order_confidence" => "orders#add_order_confidence", as: :orders_add_confidence, via: [:get, :post]
  get 'accounts/index' => 'accounts#index', :as => :accounts_path
  get 'instruments/show' => 'instruments#show', :as => :instruments_show
  match "instruments/search_instruments" => "instruments#search_instruments", as: :instruments_search_instruments, via: [:get, :post]
  match "instruments/update_current_price" => "instruments#update_current_price", as: :instruments_update_current_price, via: [:get, :post]
  match 'instruments/index' => 'instruments#index', as: :instruments_index, via: [:get, :post]
  get 'trades/index' => 'trades#index', :as => :trades_index
  get 'trades/return_distributions' => 'trades#return_distributions', :as => :trades_return_distributions
  get 'trades/holding_distributions' => 'trades#holding_distributions', :as => :trades_holding_distributions
  get 'trades/stats' => 'trades#stats', :as => :trades_stats
  get 'orders/update_users_orders' => 'orders#update_users_orders', :as => :update_users_orders
  get 'brokers' => 'brokers#index', :as => :brokers_path

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
