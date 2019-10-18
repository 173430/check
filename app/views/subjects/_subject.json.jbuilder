json.extract! subject, :id, :subjectname, :created_at, :updated_at
json.url subject_url(subject, format: :json)
