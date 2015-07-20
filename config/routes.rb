Rails.application.routes.draw do
  get '/home', to: 'static#home'
  get '/about', to: 'static#about'

  get 'auth/:provider/callback', to: 'users#create'
  get '/logout', to: 'users#logout', as: :logout

  root to: 'static#home'

end
