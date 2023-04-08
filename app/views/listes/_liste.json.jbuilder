json.extract! liste, :id, :title, :body, :created_at, :updated_at
json.url liste_url(liste, format: :json)
json.body liste.body.to_s
