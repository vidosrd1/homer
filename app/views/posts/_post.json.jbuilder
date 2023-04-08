json.extract! post, :id, :user_id, :title, :body, :publish, :created_at, :updated_at
json.url post_url(post, format: :json)
json.body post.body.to_s
