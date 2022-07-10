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
    Actor.create(name: params[:name], still_active: params[:still_active], age: params[:age])
    redirect_to '/actors'
  end
end

