require 'rails_helper'

RSpec.describe "FavoriteMovies", type: :request do
  describe "GET /favorite_movies" do
    it "works! (now write some real specs)" do
      get favorite_movies_path
      expect(response).to have_http_status(200)
    end
  end
end
