Funnies::Application.routes.draw do
  match '/about' => 'pages#about'

  root :to => "pages#landing"
end
