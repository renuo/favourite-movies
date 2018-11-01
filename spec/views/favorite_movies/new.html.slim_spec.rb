require 'rails_helper'

RSpec.describe "favorite_movies/new", type: :view do
  before(:each) do
    assign(:favorite_movie, FavoriteMovie.new())
  end

  it "renders new favorite_movie form" do
    render

    assert_select "form[action=?][method=?]", favorite_movies_path, "post" do
    end
  end
end
