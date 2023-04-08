json.extract! movie, :id, :title, :body, :created_at, :updated_at
json.url movie_url(movie, format: :json)
json.body movie.body.to_s
