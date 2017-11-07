class Gallery < ApplicationRecord
	has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_with AttachmentPresenceValidator, attributes: :picture
	validates_with AttachmentSizeValidator, attributes: :picture, less_than: 1.megabytes
	validates_with AttachmentContentTypeValidator, attributes: :picture, content_type: /\Aimage\/(png)|(jpeg)\z/
	validates :title, length: { in: 4..100 }
end
