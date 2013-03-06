class AddPositionToEpisodes < ActiveRecord::Migration
  def up
    add_column :movie_episodes, :position, :integer
  end

  def down
    remove_column :movie_episodes, :position
  end
end
