json.extract! movie, :id, :comment, :title, :external_id, :year, :poster_url, :created_at, :updated_at
json.url movie_url(movie, format: :json)
