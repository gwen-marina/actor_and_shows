class UpdateEpisodesAppearedIn < ActiveRecord::Migration[5.2]
  def change
    rename_column :actors, :episodes_appeared_in, :age
  end
end
