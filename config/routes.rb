Rails.application.routes.draw do
  # Routes for the Interact resource:
  # CREATE
  root "contacts#index"
  get "/interacts/new", :controller => "interacts", :action => "new"
  post "/create_interact", :controller => "interacts", :action => "create"

  # READ
  get "/interacts", :controller => "interacts", :action => "index"
  get "/interacts/:id", :controller => "interacts", :action => "show"

  # UPDATE
  get "/interacts/:id/edit", :controller => "interacts", :action => "edit"
  post "/update_interact/:id", :controller => "interacts", :action => "update"

  # DELETE
  get "/delete_interact/:id", :controller => "interacts", :action => "destroy"
  #------------------------------

  # Routes for the Contact resource:
  # CREATE
  get "/contacts/new", :controller => "contacts", :action => "new"
  post "/create_contact", :controller => "contacts", :action => "create"

  # READ
  get "/contacts", :controller => "contacts", :action => "all"
  get "/contacts/:id", :controller => "contacts", :action => "show"

  get "/map", :controller => "contacts", :action => "map"
  get "/calender", :controller => "contacts", :action => "calender"

  # UPDATE
  get "/contacts/:id/edit", :controller => "contacts", :action => "edit"
  post "/update_contact/:id", :controller => "contacts", :action => "update"

  # DELETE
  get "/delete_contact/:id", :controller => "contacts", :action => "destroy"
  #------------------------------
  get "/dashboards", :controller => "contacts", :action => "destroy"
  devise_for :users


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
