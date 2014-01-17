class AddYoutubeViewCountToMovieEpisodes < ActiveRecord::Migration
  def change
    add_column :movie_episodes, :youtube_view_count, :integer, default: 0
  end
end
