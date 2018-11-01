require 'rails_helper'

RSpec.describe "favorite_movies/index", type: :view do
  before(:each) do
    assign(:favorite_movies, [
      FavoriteMovie.create!(),
      FavoriteMovie.create!()
    ])
  end

  it "renders a list of favorite_movies" do
    render
  end
end
