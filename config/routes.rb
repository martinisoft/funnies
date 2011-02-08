Funnies::Application.routes.draw do

  match '/about' => 'pages#about'

  devise_for :users do
    resources :subscriptions, :only => [:index, :create, :destroy]
    resources :comics
  end

  scope "/:username", :as => "user" do
    resources :comics
    root :to => "comics#index"
  end

  resources :comics do
    resource :subscriptions, :only => [:index, :create, :destroy]
  end

  root :to => "pages#landing"
end
