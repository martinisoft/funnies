Funnies::Application.routes.draw do
  devise_for :users
  as :user do
    get "/login", :to => "devise/sessions#new", :as => 'login'
    get "/logout", :to => "devise/sessions#destroy", :as => 'logout'
  end

  match '/about' => 'pages#about'

  root :to => "pages#landing"
end
