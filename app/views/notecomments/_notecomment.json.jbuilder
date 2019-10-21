json.extract! notecomment, :id, :note_id, :user_id, :comment, :picture, :created_at, :updated_at
json.url notecomment_url(notecomment, format: :json)
