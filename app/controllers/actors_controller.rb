class ActorsController < ApplicationController

  def index 
    @actors = Actor.sort_by_newest
  end

  def show 
    @actor = Actor.find(params[:id])
  end
end

