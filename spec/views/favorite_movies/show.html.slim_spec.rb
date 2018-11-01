require 'rails_helper'

RSpec.describe "favorite_movies/show", type: :view do
  before(:each) do
    @favorite_movie = assign(:favorite_movie, FavoriteMovie.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
