Rails.application.routes.draw do
  post 'friendrequest/:requested/create' => 'friendrequest#create',as: 'create_friend_request'
  delete 'friendrequest/:request_id/remove' => 'friendrequest#remove',as: 'delete_friend_request'

  post 'comment/add'
  post 'comment/add_nested'
  delete 'comment/remove'
  patch 'comment/update'

  post 'reaction/:post_id/:reaction_type' => 'reaction#reaction_handler' ,as: 'reaction'

  post 'post/create'
  delete 'post/:id/remove' => 'post#remove'
  patch 'post/:id/update' => 'post#update'
  get 'home/index'
  get 'network' => 'home#network' ,as: 'network'
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: "home#index"
end
