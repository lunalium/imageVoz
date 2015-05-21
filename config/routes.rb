Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :user
  #devise_for :admin
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  resources :vozimage
  match "/voz" => 'vozimage#getimage', :as => "vozimage_post", :via => [:post, :get]
  #match "/voz/run" => 'vozimage#run', :as => "vozimage_run", :via =>[:post,:get]
  get "voz/show" => "vozimage#show" , :as => "vozimage_show"
  post "vozimage/:id/edit" => "vozimage#edit"
  put "vozimage/:id/edit" => "vozimage#update"
  match "voz/find" => "vozimage#find",  :as => "vozimage_find",:via => [:post, :get]
  get "voz/show/save" => "vozimage#saveimage" , :as => "save_vozimage"

  # You can have the root of your site routed with "root"
  root 'vozimage#index'

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
