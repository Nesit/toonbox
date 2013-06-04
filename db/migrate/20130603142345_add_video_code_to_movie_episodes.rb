class AddVideoCodeToMovieEpisodes < ActiveRecord::Migration
  def change
    add_column :movie_episodes, :video_code, :text
  end
end
