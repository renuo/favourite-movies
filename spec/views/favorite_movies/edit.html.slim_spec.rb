require 'rails_helper'

RSpec.describe "favorite_movies/edit", type: :view do
  before(:each) do
    @favorite_movie = assign(:favorite_movie, FavoriteMovie.create!())
  end

  it "renders the edit favorite_movie form" do
    render

    assert_select "form[action=?][method=?]", favorite_movie_path(@favorite_movie), "post" do
    end
  end
end
