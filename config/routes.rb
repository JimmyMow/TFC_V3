TFCV3::Application.routes.draw do
  #------------------------------

  # Routes for the Game_ref resource:
  # CREATE
  get '/game_refs/new', controller: 'game_refs', action: 'new', :as => 'new_game_ref'
  post '/game_refs', controller: 'game_refs', action: 'create'

  # READ
  get '/game_refs', controller: 'game_refs', action: 'index'
  get '/game_refs/:id', controller: 'game_refs', action: 'show', :as => 'game_ref'

  # UPDATE
  get '/game_refs/:id/edit', controller: 'game_refs', action: 'edit', :as => 'edit_game_ref'
  patch '/game_refs/:id', controller: 'game_refs', action: 'update'

  # DELETE
  delete '/game_refs/:id', controller: 'game_refs', action: 'destroy'
  #------------------------------

  # SESSIONS
  root to: 'sessions#new'

  get '/sessions/new' => 'sessions#new', as: 'new_session'

  post '/sessions' => 'sessions#create', as: 'session'

  get '/sessions' => 'sessions#destroy'
  # Random Pages
  get '/home' => 'pages#home', as: 'home'
  get '/stats' => 'pages#stats', as: 'stats'
  # Routes for the Comment_vote resource:
  # CREATE
  get '/comment_votes/new', controller: 'comment_votes', action: 'new', :as => 'new_comment_vote'
  post '/comment_votes', controller: 'comment_votes', action: 'create'

  # READ
  get '/comment_votes', controller: 'comment_votes', action: 'index'
  get '/comment_votes/:id', controller: 'comment_votes', action: 'show', :as => 'comment_vote'

  # UPDATE
  get '/comment_votes/:id/edit', controller: 'comment_votes', action: 'edit', :as => 'edit_comment_vote'
  patch '/comment_votes/:id', controller: 'comment_votes', action: 'update'

  # DELETE
  delete '/comment_votes/:id', controller: 'comment_votes', action: 'destroy'
  #------------------------------

  # Routes for the Challenge_vote resource:
  # CREATE
  get '/challenge_votes/new', controller: 'challenge_votes', action: 'new', :as => 'new_challenge_vote'
  post '/challenge_votes', controller: 'challenge_votes', action: 'create'

  # READ
  get '/challenge_votes', controller: 'challenge_votes', action: 'index'
  get '/challenge_votes/:id', controller: 'challenge_votes', action: 'show', :as => 'challenge_vote'

  # UPDATE
  get '/challenge_votes/:id/edit', controller: 'challenge_votes', action: 'edit', :as => 'edit_challenge_vote'
  patch '/challenge_votes/:id', controller: 'challenge_votes', action: 'update'

  # DELETE
  delete '/challenge_votes/:id', controller: 'challenge_votes', action: 'destroy'
  #------------------------------

  # Routes for the Call_vote resource:
  # CREATE
  get '/call_votes/new', controller: 'call_votes', action: 'new', :as => 'new_call_vote'
  post '/call_votes', controller: 'call_votes', action: 'create'

  # READ
  get '/call_votes', controller: 'call_votes', action: 'index'
  get '/call_votes/:id', controller: 'call_votes', action: 'show', :as => 'call_vote'

  # UPDATE
  get '/call_votes/:id/edit', controller: 'call_votes', action: 'edit', :as => 'edit_call_vote'
  patch '/call_votes/:id', controller: 'call_votes', action: 'update'

  # DELETE
  delete '/call_votes/:id', controller: 'call_votes', action: 'destroy'
  #------------------------------

  # Routes for the Comment resource:
  # CREATE
  get '/comments/new', controller: 'comments', action: 'new', :as => 'new_comment'
  post '/comments', controller: 'comments', action: 'create'

  # READ
  get '/comments', controller: 'comments', action: 'index'
  get '/comments/:id', controller: 'comments', action: 'show', :as => 'comment'

  # UPDATE
  get '/comments/:id/edit', controller: 'comments', action: 'edit', :as => 'edit_comment'
  patch '/comments/:id', controller: 'comments', action: 'update'

  # DELETE
  delete '/comments/:id', controller: 'comments', action: 'destroy'
  #------------------------------

  # Routes for the Challenge resource:
  # CREATE
  get '/challenges/new', controller: 'challenges', action: 'new', :as => 'new_challenge'
  post '/challenges', controller: 'challenges', action: 'create'

  # READ
  get '/challenges', controller: 'challenges', action: 'index'
  get '/challenges/:id', controller: 'challenges', action: 'show', :as => 'challenge'

  # UPDATE
  get '/challenges/:id/edit', controller: 'challenges', action: 'edit', :as => 'edit_challenge'
  patch '/challenges/:id', controller: 'challenges', action: 'update'

  # DELETE
  delete '/challenges/:id', controller: 'challenges', action: 'destroy'
  #------------------------------

  # Routes for the Call resource:
  # CREATE
  get '/calls/new', controller: 'calls', action: 'new', :as => 'new_call'
  post '/calls', controller: 'calls', action: 'create'

  # READ
  get '/calls', controller: 'calls', action: 'index'
  get '/calls/:id', controller: 'calls', action: 'show', :as => 'call'

  # UPDATE
  get '/calls/:id/edit', controller: 'calls', action: 'edit', :as => 'edit_call'
  patch '/calls/:id', controller: 'calls', action: 'update'

  # DELETE
  delete '/calls/:id', controller: 'calls', action: 'destroy'
  #------------------------------

  # Routes for the User resource:
  # CREATE
  get '/users/new', controller: 'users', action: 'new', :as => 'new_user'
  post '/users', controller: 'users', action: 'create'

  # READ
  get '/users', controller: 'users', action: 'index'
  get '/users/:id', controller: 'users', action: 'show', :as => 'user'

  # UPDATE
  get '/users/:id/edit', controller: 'users', action: 'edit', :as => 'edit_user'
  patch '/users/:id', controller: 'users', action: 'update'

  # DELETE
  delete '/users/:id', controller: 'users', action: 'destroy'
  #------------------------------

  # Routes for the Game resource:
  # CREATE
  get '/games/new', controller: 'games', action: 'new', :as => 'new_game'
  post '/games', controller: 'games', action: 'create'

  # READ
  get '/games', controller: 'games', action: 'index'
  get '/games/:id', controller: 'games', action: 'show', :as => 'game'

  # UPDATE
  get '/games/:id/edit', controller: 'games', action: 'edit', :as => 'edit_game'
  patch '/games/:id', controller: 'games', action: 'update'

  # DELETE
  delete '/games/:id', controller: 'games', action: 'destroy'
  #------------------------------

  # Routes for the Team resource:
  # CREATE
  get '/teams/new', controller: 'teams', action: 'new', :as => 'new_team'
  post '/teams', controller: 'teams', action: 'create'

  # READ
  get '/teams', controller: 'teams', action: 'index'
  get '/teams/:id', controller: 'teams', action: 'show', :as => 'team'

  # UPDATE
  get '/teams/:id/edit', controller: 'teams', action: 'edit', :as => 'edit_team'
  patch '/teams/:id', controller: 'teams', action: 'update'

  # DELETE
  delete '/teams/:id', controller: 'teams', action: 'destroy'
  #------------------------------

  # Routes for the Player resource:
  # CREATE
  get '/players/new', controller: 'players', action: 'new', :as => 'new_player'
  post '/players', controller: 'players', action: 'create'

  # READ
  get '/players', controller: 'players', action: 'index'
  get '/players/:id', controller: 'players', action: 'show', :as => 'player'

  # UPDATE
  get '/players/:id/edit', controller: 'players', action: 'edit', :as => 'edit_player'
  patch '/players/:id', controller: 'players', action: 'update'

  # DELETE
  delete '/players/:id', controller: 'players', action: 'destroy'
  #------------------------------

  # Routes for the Ref resource:
  # CREATE
  get '/refs/new', controller: 'refs', action: 'new', :as => 'new_ref'
  post '/refs', controller: 'refs', action: 'create'

  # READ
  get '/refs', controller: 'refs', action: 'index'
  get '/refs/:id', controller: 'refs', action: 'show', :as => 'ref'

  # UPDATE
  get '/refs/:id/edit', controller: 'refs', action: 'edit', :as => 'edit_ref'
  patch '/refs/:id', controller: 'refs', action: 'update'

  # DELETE
  delete '/refs/:id', controller: 'refs', action: 'destroy'
  #------------------------------

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
