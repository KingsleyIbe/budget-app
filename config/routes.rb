# Rails.application.routes.draw do
#   devise_for :users
#   resources :users
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   authenticated :user do
#     root to: "groups#index", as: :authenticated_root
#   end

#   resources :groups, only: [:index, :new, :create] do
#     resources :expenses, only: [:index, :new, :create]
#   end

#   # Defines the root path route ("/")
#   # root "articles#index"
#   root to: "home#index"
# end

Rails.application.routes.draw do
  devise_for :users 
  devise_scope  :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end
  
  resources :users do 
    resources :groups do
      resources :expenditures
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#splash"

end

