Flexmod::Application.routes.draw do
  resources :configuration_keys

  resources :alarms

  get "fm_configuration/read_fm_frequency"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'dashboard#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase
  
  post 'send_command' , to: 'dashboard#send_command'
  get 'send_command' , to: 'dashboard#send_command'
  get 'fm_configuration', to: 'fm_configuration#index'
  post 'fm_configuration', to: 'fm_configuration#save'
  get 'rds_configuration', to: 'rds_configuration#index'
  post 'rds_configuration', to: 'rds_configuration#save'
  
  get 'login', to: 'dashboard#login'
  get 'settings', to: 'settings#index'

  #get 'read_fm_frequency', to: 'fm_configuration#read_fm_frequency'

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #resources :fm_configuration
	
	resources :alarms do 
		resources :alarm_conditions
	end
	
  get ':controller(/:action)'
  post ':controller(/:action)'
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
