json.extract! question, :id, :question, :grade, :subject_id, :picture, :nameless, :solve, :created_at, :updated_at
json.url question_url(question, format: :json)
