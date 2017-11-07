json.extract! message, :id, :name, :lastname, :email, :phone, :message, :created_at, :updated_at
json.url message_url(message, format: :json)
