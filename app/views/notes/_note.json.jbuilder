json.extract! note, :id, :user_id, :title, :picture, :coverpicture, :grade_id, :subject_id, :extra, :good, :release, :created_at, :updated_at
json.url note_url(note, format: :json)
