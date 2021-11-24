json.extract! commentaire, :id, :message, :created_at, :updated_at
json.url commentaire_url(commentaire, format: :json)
