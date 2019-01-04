require 'rails_helper'

RSpec.describe "movies/edit", type: :view do
  before(:each) do
    @movie = assign(:movie, Movie.create!(
      :comment => "MyText",
      :title => "MyString",
      :exteranl_id => "MyString",
      :year => 1,
      :poster_url => "MyString"
    ))
  end

  it "renders the edit movie form" do
    render

    assert_select "form[action=?][method=?]", movie_path(@movie), "post" do

      assert_select "textarea[name=?]", "movie[comment]"

      assert_select "input[name=?]", "movie[title]"

      assert_select "input[name=?]", "movie[exteranl_id]"

      assert_select "input[name=?]", "movie[year]"

      assert_select "input[name=?]", "movie[poster_url]"
    end
  end
end
