class AddColumnToTableEpisodes < ActiveRecord::Migration
  def change
    add_column :table_episodes, :add_video_url, :string
    add_column :table_episodes, :string, :string
  end
end
