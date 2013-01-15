class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.timestamps
    end
    Movie.create_translation_table! title: :string,
                                    description: :text
  end
end
