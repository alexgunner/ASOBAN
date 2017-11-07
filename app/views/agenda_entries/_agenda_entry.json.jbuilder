json.extract! agenda_entry, :id, :pdf, :event_id, :created_at, :updated_at
json.url agenda_entry_url(agenda_entry, format: :json)
