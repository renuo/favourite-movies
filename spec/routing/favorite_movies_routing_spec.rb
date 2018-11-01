require "rails_helper"

RSpec.describe FavoriteMoviesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/favorite_movies").to route_to("favorite_movies#index")
    end

    it "routes to #new" do
      expect(:get => "/favorite_movies/new").to route_to("favorite_movies#new")
    end

    it "routes to #show" do
      expect(:get => "/favorite_movies/1").to route_to("favorite_movies#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/favorite_movies/1/edit").to route_to("favorite_movies#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/favorite_movies").to route_to("favorite_movies#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/favorite_movies/1").to route_to("favorite_movies#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/favorite_movies/1").to route_to("favorite_movies#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/favorite_movies/1").to route_to("favorite_movies#destroy", :id => "1")
    end
  end
end
