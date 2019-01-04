require 'rails_helper'

RSpec.describe "movies/index", type: :view do
  before(:each) do
    assign(:movies, [
      Movie.create!(
        :comment => "MyText",
        :title => "Title",
        :exteranl_id => "Exteranl",
        :year => 2,
        :poster_url => "Poster Url"
      ),
      Movie.create!(
        :comment => "MyText",
        :title => "Title",
        :exteranl_id => "Exteranl",
        :year => 2,
        :poster_url => "Poster Url"
      )
    ])
  end

  it "renders a list of movies" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Exteranl".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Poster Url".to_s, :count => 2
  end
end
