json.array! @whines do |whine|
    json.extract! whine, :id, :title, :body, :whiner_id, :created_at
end