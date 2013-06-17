class AddOfficialUrlToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :official_url, :string
  end
end
