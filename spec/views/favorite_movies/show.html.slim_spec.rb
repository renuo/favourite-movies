require 'rails_helper'

RSpec.describe "favorite_movies/show", type: :view do
  before(:each) do
    @favorite_movie = assign(:favorite_movie, FavoriteMovie.create!(
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
  end
end
