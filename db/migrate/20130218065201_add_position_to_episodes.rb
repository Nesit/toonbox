class AddPositionToEpisodes < ActiveRecord::Migration
  def up
    add_column :movie_episodes, :position, :integer
    MovieEpisode.clear_positions
  end

  def down
    remove_column :movie_episodes, :position
  end
end
