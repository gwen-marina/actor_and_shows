  Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'application#welcome'
  
  get '/actors', to: 'actors#index'
  get '/tvshows', to: 'tv_shows#index'
  get '/tvshows/:id', to: 'tv_shows#show'
  get '/actors/:id/tvshows', to: 'actor_tv_shows#index'
  get '/actors/new', to: 'actors#new'
  post '/actors', to: 'actors#create'
  get '/actors/:id/edit', to: 'actors#edit'
  patch '/actors/:id', to: 'actors#update'
  get '/actors/:id', to: 'actors#show'
  get '/actors/:id/tvshows/new', to: 'actor_tv_shows#new'
  post '/actors/:id/tvshows', to: 'actor_tv_shows#create'
  get '/tvshows/:id/edit', to: 'tv_shows#edit'
  patch 'tvshows/:id', to: 'tv_shows#update'
  delete 'actors/:id', to: 'actors#destroy'
  delete 'tvshows/:id', to: 'tv_shows#destroy'
end
