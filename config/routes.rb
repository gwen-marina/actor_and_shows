Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/actors', to: 'actors#index'
  get '/tvshows', to: 'tv_shows#index'
  get '/tvshows/:id', to: 'tv_shows#show'
  get '/actors/:id/tvshows', to: 'actor_tv_shows#index'
  get '/actors/new', to: 'actors#new'
  post '/actors', to: 'actors#create'
  get '/actors/:id/edit', to: 'actors#edit'
  patch '/actors/:id', to: 'actors#update'
  get '/actors/:id', to: 'actors#show'
end
