Rails.application.routes.draw do
  resources :development_skills

  devise_for :users

  get 'Profile' => 'user#Profile'

  get 'Home' => 'static_pages#Home'

  get 'About' => 'static_pages#About'

  get 'Help' => 'static_pages#Help'

  get 'Settings' => 'static_pages#Settings'

  get 'Dashboard' => 'user#Dashboard'

  get 'admin' => 'admin#index'
 
  get 'admin/skill_category' => 'admin#skill_category'

  get 'admin/edit_skill_category' => 'admin#edit_skill_category'

  post 'admin/create_skill_category' => 'admin#create_skill_category'

  patch 'admin/update_skill_category' => 'admin#update_skill_category'

  delete 'admin/destroy_skill_category' => 'admin#destroy_skill_category'

  resources :development_plan

  resources :skills

  # Create won't work without below. Need to fix Create page to work with resources
  post 'development_plan/create'

  get 'development_plan/show'

  resources :development_tasks
  resources :skill_categories
  resources :skill_levels
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#Home'

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
