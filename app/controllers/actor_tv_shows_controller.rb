class ActorTvShowsController < ApplicationController

  def index 
    @actor = Actor.find(params[:id])
    if params[:alpha] == "yes"
      @tv_shows = @actor.tv_shows.alphabetical_order
    else
      @tv_shows = @actor.tv_shows
    end    
  end

  def new
    @id = params[:id]
  end

  def create 
    TvShow.create(name: params[:name], on_air: params[:on_air],
                  number_of_episodes: params[:number_of_episodes], actor_id: params[:id])
    redirect_to "/actors/#{params[:id]}/tvshows"
  end
end