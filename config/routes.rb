Funnies::Application.routes.draw do

  get '/about' => 'pages#about', as: :about
  get '/copyright' => 'pages#copyright', as: :copyright

  scope "/blog" do
    resources :posts
  end

  devise_for :users
  devise_scope :users do
    resources :suggestions, except: [:destroy]
    resources :subscriptions, only: [:index, :create, :destroy]
    resources :comics
    get "comics", to: "comics#index", as: :user_root
  end

  scope "/:username", as: "user" do
    resources :comics
  end

  resources :comics do
    resource :subscriptions, only: [:index, :create, :destroy]
  end

  root "pages#landing"
end
