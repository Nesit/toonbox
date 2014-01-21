class AddVimeoViewCountToMovieEpisodes < ActiveRecord::Migration
  def change
    add_column :movie_episodes, :vimeo_view_count, :integer
  end
end
