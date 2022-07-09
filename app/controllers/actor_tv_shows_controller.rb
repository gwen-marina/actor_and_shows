class ActorTvShowsController < ApplicationController

  def index 
    @actors_shows = Actor.find(params[:id]).tv_shows
  end
end