json.array! @whines do |whine|
    json.id whine.id
    json.title whine.title
    json.body whine.body
    json.whiner_id whine.whiner_id
end