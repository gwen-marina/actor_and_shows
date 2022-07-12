class ActorsController < ApplicationController

  def index 
    @actors = Actor.sort_by_newest
  end

  def show 
    @actor = Actor.find(params[:id])
  end
  
  def new 
  end

  def create 
    Actor.create(actor_params)
    redirect_to '/actors'
  end

  def edit
    @actor = Actor.find(params[:id])
  end

  def update 
    actor = Actor.find(params[:id])  
    actor.update(actor_params)
    redirect_to "/actors/#{actor.id}"
  end

  def destroy 
    actor = Actor.find(params[:id])
    actor.tv_shows
    actor.destroy
    redirect_to '/actors'
  end

private
  def actor_params 
    params.permit(:name, :still_active, :age)
  end
end

