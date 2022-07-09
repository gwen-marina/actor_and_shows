class CreateTvShows < ActiveRecord::Migration[5.2]
  def change
    create_table :tv_shows do |t|
      t.string :name
      t.boolean :on_air
      t.integer :number_of_episodes

      t.timestamps
    end
  end
end
