Rails.application.routes.draw do
root to: "top#index"
get "about" => "top#about", as: "about"
get "bad_request" => "top#bad_request"
get "forbidden" => "top#forbidden"
get "internal_server_error" => "top#internal_server_error"
resources :books do
  get "search", on: :collection
end

resources :members, only: [:index,:show] do
  get "search", on: :collection
  resources :entries,only: [:index]
end

resource :session, only: [:create, :destroy]
resource :account, only: [:show, :edit, :update]
resource :password, only: [:show, :edit, :update ]


resources :articles, only: [:index, :show]
resources :entries do
  resources :images, controller: "entry_images" do
  patch :move_higher, :move_lower,on: :member
end
end

  namespace :admin do
    root to: "top#index"
    resources :members do
    get "search", on: :collection
  end
  resources :articles 
end

end
