json.array! @whiners do |whiner|
  json.extract! whiner, :id, :username, :email, :created_at
end