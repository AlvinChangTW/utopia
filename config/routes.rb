Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :goods
  resources :givings
  get '/auth/:provider/callback' => 'sessions#create'
  post '/auth/signout' => "sessions#destroy"
  root :to=> "goods#index"
end
