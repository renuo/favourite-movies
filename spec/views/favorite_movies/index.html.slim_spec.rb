require 'rails_helper'

RSpec.describe "favorite_movies/index", type: :view do
  before(:each) do
    assign(:favorite_movies, [
      FavoriteMovie.create!(
        :title => "Title"
      ),
      FavoriteMovie.create!(
        :title => "Title"
      )
    ])
  end

  it "renders a list of favorite_movies" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
