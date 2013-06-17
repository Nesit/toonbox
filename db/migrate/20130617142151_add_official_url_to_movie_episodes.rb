class AddOfficialUrlToMovieEpisodes < ActiveRecord::Migration
  def change
    add_column :movie_episodes, :official_url, :string
  end
end
