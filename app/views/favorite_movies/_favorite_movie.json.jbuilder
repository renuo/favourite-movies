json.extract! favorite_movie, :id, :title, :created_at, :updated_at
json.url favorite_movie_url(favorite_movie, format: :json)
