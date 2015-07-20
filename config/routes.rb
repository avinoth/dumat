Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'users#login'
  get '/logout', to: 'users#logout', as: :logout

end
