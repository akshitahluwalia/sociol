Rails.application.routes.draw do
  get 'profiles/profile:get'

  get 'profiles/update:post'

  post 'friend_mapping/:user/create' => 'friend_mapping#create', as: 'friend_mapping_create'
  delete 'friend_mapping/:user/remove' => 'friend_mapping#remove', as: 'friend_mapping_remove'

  post 'friendrequest/:requested/create' => 'friendrequest#create', as: 'create_friend_request'
  delete 'friendrequest/:request_id/remove' => 'friendrequest#remove', as: 'delete_friend_request'

  post 'comment/add' => 'comment#add', as: 'add_comment'
  post 'comment/add_nested' => 'comment#add_nested', as: 'add_nested_comment'
  delete 'comment/:id/remove' => 'comment#remove', as: 'remove_comment'
  patch 'comment/:id/update' => 'comment#update', as: 'update_comment'

  post 'reaction/:post_id/:reaction_type' => 'reaction#reaction_handler', as: 'reaction'

  post 'post/create', as: 'post_create'
  delete 'post/:id/remove' => 'post#remove', as: 'post_remove'
  patch 'post/:id/update' => 'post#update', as: 'post_update'
  post 'post/:id/share' => 'post#share', as: 'post_share'
  get 'home/index'
  get 'network' => 'home#network', as: 'network'
  devise_for :users, :controllers => {registrations: 'registrations'}
  root to: "home#index"
end
