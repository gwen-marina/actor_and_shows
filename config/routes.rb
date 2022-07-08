Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/actors', to: 'actors#index'
  get '/actors/:id', to: 'actors#show'
end
