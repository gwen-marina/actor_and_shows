class AddActorToTvShow < ActiveRecord::Migration[5.2]
  def change
    add_reference :tv_shows, :actor, foreign_key: true
  end
end
