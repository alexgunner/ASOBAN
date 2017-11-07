json.extract! contact, :id, :name, :emails, :phone_numbers, :created_at, :updated_at
json.url contact_url(contact, format: :json)