class AgendaEntry < ApplicationRecord
  has_attached_file :pdf
  validates_with AttachmentPresenceValidator, attributes: :pdf
  validates_with AttachmentSizeValidator, attributes: :pdf, less_than: 50.megabytes
  validates_with AttachmentContentTypeValidator, attributes: :pdf, content_type: ["application/pdf"]
  validates :title, length: { in: 4..100 }
  belongs_to :event
end
