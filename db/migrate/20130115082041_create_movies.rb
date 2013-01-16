class CreateMovies < ActiveRecord::Migration
  def up
    create_table :movies do |t|
      t.timestamps
    end
    Movie.create_translation_table! title: :string,
                                    description: :text
  end

  def down
    drop_table :movies
    Movie.drop_translation_table!
  end
end
