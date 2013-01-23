class CreateMovieEpisodes < ActiveRecord::Migration
  def up
    create_table :movie_episodes do |t|
      t.integer :movie_id, null: false
      t.text :video_url
      t.timestamps
    end
    MovieEpisode.create_translation_table!({ title: :string, description: :text },
                                           { migrate_data: true }
                                          )
  end

  def down
    drop_table :movie_episodes
    MovieEpisode.drop_translation_table! migrate_data: true
  end

end
