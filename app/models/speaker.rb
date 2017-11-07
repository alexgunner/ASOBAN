class Speaker < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  validates_with AttachmentPresenceValidator, attributes: :image
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 1.megabytes
  validates_with AttachmentContentTypeValidator, attributes: :image, content_type: /\Aimage\/(png)|(jpeg)\z/

  has_attached_file :pdf
  validates_with AttachmentSizeValidator, attributes: :pdf, less_than: 50.megabytes
  validates_with AttachmentContentTypeValidator, attributes: :pdf, content_type: ["application/pdf"]

  validates :title, length: { in: 4..100 }

  belongs_to :event

end
