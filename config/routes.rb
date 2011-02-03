Funnies::Application.routes.draw do
  devise_for :users do
    resources :subscriptions
  end
  as :user do
    get "/login", :to => "devise/sessions#new", :as => 'login'
    get "/logout", :to => "devise/sessions#destroy", :as => 'logout'
  end

  resources :comics do
    resource :subscriptions
  end

  match '/about' => 'pages#about'

  root :to => "pages#landing"
end
