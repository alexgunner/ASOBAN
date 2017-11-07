json.extract! admin, :id, :first_name, :last_name, :can_manage_contact, :can_manage_faq, :can_manage_about, :can_manage_articles, :can_manage_events, :can_manage_links, :can_manage_multimedia, :can_manage_carousel, :can_manage_newsletter, :created_at, :updated_at
json.url admin_url(admin, format: :json)
