Rails.application.routes.draw do

  resources :questions do
    resources :answers, except: :new
  end


  # Sometimes when we get creative with our route name or the action name it's
  # becuse we're forgetting a simple way to do things.  But I think what wiould
  # be best here would be:
  # post 'questions/:id/
  get 'questions/:id/best', to: 'questions#set_best'

  post 'vote', to: 'votes#create_or_update'

  resources :tags, only: [:create, :show]
  resources :post_votes, only: [:create, :update] # I don't think you want these expressed to the outside, generally join models are not available as HTTP interactive things.
  resources :comments, except: :index
  resource :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :favorites, only: [:create, :destroy]

  # Vestigial..
  get 'suggestion', to: 'questions#load_suggestions'

  root to: 'questions#index'

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
