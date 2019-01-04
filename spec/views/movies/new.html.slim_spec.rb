require 'rails_helper'

RSpec.describe "movies/new", type: :view do
  before(:each) do
    assign(:movie, Movie.new(
      :comment => "MyText",
      :title => "MyString",
      :exteranl_id => "MyString",
      :year => 1,
      :poster_url => "MyString"
    ))
  end

  it "renders new movie form" do
    render

    assert_select "form[action=?][method=?]", movies_path, "post" do

      assert_select "textarea[name=?]", "movie[comment]"

      assert_select "input[name=?]", "movie[title]"

      assert_select "input[name=?]", "movie[exteranl_id]"

      assert_select "input[name=?]", "movie[year]"

      assert_select "input[name=?]", "movie[poster_url]"
    end
  end
end
