Rails.application.routes.draw do

  post '/login', to: 'session#create'

  post '/signup', to: 'users#create'

  get '/me', to: 'users#show'

  delete '/logout', to: 'session#destroy'

end
