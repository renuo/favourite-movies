require 'rails_helper'

RSpec.describe "movies/show", type: :view do
  before(:each) do
    @movie = assign(:movie, Movie.create!(
      :comment => "MyText",
      :title => "Title",
      :exteranl_id => "Exteranl",
      :year => 2,
      :poster_url => "Poster Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Exteranl/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Poster Url/)
  end
end
