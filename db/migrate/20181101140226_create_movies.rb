class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.text :comment
      t.string :title
      t.string :external_id
      t.integer :year
      t.string :poster_url

      t.timestamps
    end
  end
end
