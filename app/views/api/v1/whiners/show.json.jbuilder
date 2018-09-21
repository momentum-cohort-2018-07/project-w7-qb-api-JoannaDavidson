json.links do
    json.self api_v1_whiner_url(@whiner)
    json.list api_v1_whiners_url
    json.update do
        json.method "PUT"
        json.href api_v1_whiner_url(@whiner)
    end
    json.delete do
        json.method "DELETE"
        json.href api_v1_whiner_url(@whiner)
    end
end

json.data do
    json.id @whiner.id
    json.attributes do
        json.username @whiner.username
        json.email @whiner.email
        json.auth_token @whiner.auth_token
    end
end