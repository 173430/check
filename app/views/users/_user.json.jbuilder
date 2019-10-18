json.extract! user, :id, :classroom_id, :userid, :name, :icon, :introduce, :password, :release, :created_at, :updated_at
json.url user_url(user, format: :json)
