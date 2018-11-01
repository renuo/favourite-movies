class CreateFavouriteMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :favourite_movies do |t|
      t.string :title
      t.string :year
      t.string :imdb_id
      t.string :movie_type
      t.string :poster

      t.timestamps
    end
  end
end
