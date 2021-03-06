Rails.application.routes.draw do
  
  get 'comments/show'

  get 'comments/edit'

  #get 'page/home'

  #resources :widgets

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  root 'page#home'

  # controller pages action home
  get '/welcome', to:'welcome#index'

  # show all recipes 
  # get '/recipes', to: 'recipes#index'
  # get '/recipes/new', to: 'recipes#new', as: 'new_recipe'
  # post '/recipes', to: 'recipes#create'
  # get 'recipes/:id/edit', to: 'recipes#edit', as: 'edit_recipe'
  # # handle the submission of template, put/patch
  # patch 'recipes/:id', to: 'recipes#update'
  # # show recipes as individual recipes
  # get 'recipes/:id', to: 'recipes#show', as: 'recipe'
  # delete 'recipes/:id', to: 'recipes#destroy'

  # Tudo isso pode ser substituido por:
  # o rails faz tudo de forma automatica todas
  # essas funções básicas
  resources :recipe do
    resources :comments # right way

    member do
      post 'like' # quando temos algo intercalado com recipe
    end
  end

  resources :comments do
    resources :comments
  end


  # Ao invés do caminh ser novo chef, temos um nome melho no caso
  # register, olhar no rake roues | grep chefs
  resources :chefs, except: [:new]
  get '/register', to: 'chefs#new'

  # Creating Login/logout action routes:
  get '/login', to: 'logins#new' 
  post '/login', to: 'logins#create'
  get '/logout', to: 'logins#destroy'


  # Ao invés de cuidar de todo o tipo de 
  resources :styles, only:  [:new, :create, :show]
  resources :ingredients, only:  [:new, :create, :show]





  #
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
