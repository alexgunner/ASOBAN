json.extract! speaker, :id, :title, :image, :pdf, :event_id, :created_at, :updated_at
json.url speaker_url(speaker, format: :json)
