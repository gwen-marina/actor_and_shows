class TvShowsController < ApplicationController

  def index 
    @tv_shows = TvShow.all
  end

  def show
    @tv_show = TvShow.find(params[:id])
  end

  def edit 
    @tv_show = TvShow.find(params[:id])
  end

  def update 
    tv_show = TvShow.find(params[:id])
    tv_show.update(tv_show_params)
    redirect_to "/tvshows/#{tv_show.id}"
  end

  def destroy 
    tv_show = TvShow.find(params[:id])
    tv_show.destroy
    redirect_to '/tvshows'
  end

private
  def tv_show_params 
    params.permit(:name, :on_air, :number_of_episodes)
  end
end