Funnies::Application.routes.draw do

  get '/about' => 'pages#about', as: :about
  get '/copyright' => 'pages#copyright', as: :copyright

  scope "/blog" do
    resources :posts
    root to: "posts#index"
  end

  devise_scope :user do
    get "comics", to: "comics#index", as: :user_root
  end
  devise_for :users

  resources :comics do
    resource :subscriptions, only: [:index, :create, :destroy]
  end

  resource :users do
    resource :token, only: [:create, :destroy]
  end

  authenticate do
    resources :suggestions, except: [:destroy]
    scope "/:username", as: "user" do
      resources :comics
      root to: "comics#index"
    end
  end

  root to: "pages#landing"
end
