json.extract! discussion, :id, :type, :titre, :created_at, :updated_at
json.url discussion_url(discussion, format: :json)
