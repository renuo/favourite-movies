class CreateFavoriteMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_movies do |t|
      t.string :title
      t.integer :year
      t.string :poster
      t.timestamps
    end
  end
end
