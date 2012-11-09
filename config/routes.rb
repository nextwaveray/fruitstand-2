Fruitstand::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  get '/cart' => "cart#show", as: 'cart'
  post '/cart/add_item/:product_id' => "cart#add_item", as: 'add_item_cart'
  post '/cart/remove_item/:line_item_id' => "cart#remove_item", as: 'remove_item_cart'
  post '/checkout' => "cart#checkout", as: 'checkout_cart'

  root :to => 'products#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
