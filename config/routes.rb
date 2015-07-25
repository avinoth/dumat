Rails.application.routes.draw do
  resources :requests do
    member do
      get 'upvote'
    end
  end

  get '/home', to: 'static#home'
  get '/about', to: 'static#about'

  get '/auth/github', as: :login
  get 'auth/:provider/callback', to: 'users#create'
  get '/logout', to: 'users#logout', as: :logout

  root to: 'static#home'

end
