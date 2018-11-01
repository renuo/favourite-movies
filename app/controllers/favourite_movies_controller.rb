class FavouriteMoviesController < ApplicationController
  def index
    @movies = FavouriteMovie.all
    render json: @movies
  end

  def create
    @movie = FavouriteMovie.new(favourite_movie_params)
    if @movie.save
      render json: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  private

  def favourite_movie_params
    params.require(:favourite_movie).permit(:title, :year, :movie_type, :imdb_id, :poster)
  end
end
