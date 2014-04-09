class AddColumnToTableEpisodes < ActiveRecord::Migration
  def change
    add_column :movie_episodes, :add_video_url, :string
  end
end
