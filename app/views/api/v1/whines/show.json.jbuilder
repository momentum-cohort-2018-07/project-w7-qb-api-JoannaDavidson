json.links do
    json.self api_v1_whine_url(@whine)
    json.list api_v1_whines_url
    json.update do
        json.method "PUT"
        json.href api_v1_whine_url(@whine)
    end
    json.delete do
        json.method "DELETE"
        json.href api_v1_whine_url(@whine)
    end
end

json.data do
    json.id @whine.id
    json.attributes do
        json.title @whine.title
        json.body @whine.body
        json.whiner_id @whine.whiner_id
    end
end
