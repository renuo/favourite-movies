require 'rails_helper'

RSpec.describe "favorite_movies/new", type: :view do
  before(:each) do
    assign(:favorite_movie, FavoriteMovie.new(
      :title => "MyString"
    ))
  end

  it "renders new favorite_movie form" do
    render

    assert_select "form[action=?][method=?]", favorite_movies_path, "post" do

      assert_select "input[name=?]", "favorite_movie[title]"
    end
  end
end
