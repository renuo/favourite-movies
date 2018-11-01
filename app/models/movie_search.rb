require 'open-uri'

class MovieSearch
  include ActiveModel::Model
  attr_accessor :query

  def results
    response = open("https://www.omdbapi.com/?apikey=6499c791&s=#{query}").read
    json = JSON.parse(response)
    json['Search'].map { |movie| FavoriteMovie.new(title: movie['Title']) }
  end
end
