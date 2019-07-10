Rails.application.routes.draw do
  
resources :posts
root 'posts#index'
  # get 'posts/index'
  # get 'posts/show'
  # get 'posts/new'
  # get 'posts/create'
  # get 'posts/destroy'
  # get 'posts/update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
