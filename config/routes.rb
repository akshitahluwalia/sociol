Rails.application.routes.draw do
  post 'reaction/:post_id/:reaction_type' => 'reaction#reaction_handler' ,as: "reaction"

  post 'post/create'
  delete 'post/:id/remove' => 'post#remove'
  patch 'post/:id/update' => 'post#update'
  get 'home/index'
  get 'network' => 'home#network' ,as: 'network'
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: "home#index"
end
