class CreateMovieImages < ActiveRecord::Migration
  def change
    create_table :movie_images do |t|
      t.string :relation_type, null: false
      t.integer :relation_id, null: false

      t.attachment :image
      t.boolean :default
      t.timestamps
    end
  end
end
