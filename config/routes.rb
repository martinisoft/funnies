Funnies::Application.routes.draw do
  devise_for :users, :path_names => { :sign_in => 'login', 
                                      :sign_out => 'logout',
                                      :registration => 'register' }

  match '/about' => 'pages#about'

  root :to => "pages#landing"
end
