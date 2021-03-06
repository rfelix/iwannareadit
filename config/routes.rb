IwannareaditRmu4::Application.routes.draw do
  root :to => "books#index"

  match "/auth/:providor/callback", :to => "sessions#create"
  match "/auth/failure",            :to => "sessions#failure", :as => ''

  match "/books/bought", :to => "books#bought", :as => "bought_books"
  resources :books do
    resources :comments
    resources :reservations, :only => [:create, :destroy] do
      put "check_out", :singular => true
      put "check_in",  :singular => true
    end

    match "/votes/up",   :to => "votes#up",   :as => 'vote_up'
    match "/votes/down", :to => "votes#down", :as => 'vote_down'
    match "/mark_bought", :to => "books#mark_bought", :as => 'mark_as_bought'
    match "/unmark_bought", :to => "books#unmark_bought", :as => 'unmark_as_bought'
  end

  match "/login",   :to => "sessions#new",     :as => "login"
  match "/logout",  :to => "sessions#destroy", :as => "logout"

  match "/users", :to => "users#index", :as => "users"
  match "/users/:id/promote", :to => "users#promote", :as => "user_promote"
  match "/users/:id/demote", :to => "users#demote", :as => "user_demote"

  resources :reservations, :only => [:index]

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
