json.array!(@chats) do |chat|
  json.extract! chat, :id, :name
  json.url chat_url(chat, format: :json)
end
