class AddPositionToMovies < ActiveRecord::Migration
  def up
    add_column :movies, :position, :integer
    Movie.clear_positions
  end

  def down
    remove_column :movies, :position
  end
end
