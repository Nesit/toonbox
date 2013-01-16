class CreateMovieImages < ActiveRecord::Migration
  def change
    create_table :movie_images do |t|
      t.integer :movie_id, null: false
      t.attachment :image
      t.boolean :default
      t.timestamps
    end
  end
end
