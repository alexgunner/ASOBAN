class Sponsor < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_with AttachmentPresenceValidator, attributes: :image
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 1.megabytes
  validates_with AttachmentContentTypeValidator, attributes: :image, content_type: /\Aimage\/(png)|(jpeg)\z/
  belongs_to :event
end
