class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :actors, :main_actor, :still_active
  end
end
