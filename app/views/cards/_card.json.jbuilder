json.extract! card, :id, :twitter, :certifications, :newsfeed, :title, :content, :url, :created_at, :updated_at
json.url card_url(card, format: :json)
