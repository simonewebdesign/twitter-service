json.array!(@users) do |user|
  json.extract! user, :id, :handle, :followers
  json.url user_url(user, format: :json)
end
