class CreateMovies < ActiveRecord::Migration
  def up
    create_table :movies do |t|
      t.timestamps
      t.boolean :new_movie
      t.boolean :awarded
    end
    Movie.create_translation_table!({ title: :string, description: :text, awarded_text: :text },
                                    { migrate_data: true }
                                   )
  end

  def down
    drop_table :movies
    Movie.drop_translation_table! migrate_data: true
  end
end
