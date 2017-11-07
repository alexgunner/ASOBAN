class Event < ApplicationRecord
	include PgSearch
  multisearchable :against => [:title, :description]

	has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_with AttachmentPresenceValidator, attributes: :picture
  validates_with AttachmentSizeValidator, attributes: :picture, less_than: 1.megabytes
  validates_with AttachmentContentTypeValidator, attributes: :picture, content_type: /\Aimage\/(png)|(jpeg)\z/

	has_attached_file :registration_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_with AttachmentContentTypeValidator, attributes: :registration_image, content_type: /\Aimage\/(png)|(jpeg)\z/
	validates_with AttachmentSizeValidator, attributes: :registration_image, less_than: 1.megabytes

	has_attached_file :registration_pdf
	validates_with AttachmentSizeValidator, attributes: :registration_pdf, less_than: 50.megabytes
  validates_with AttachmentContentTypeValidator, attributes: :registration_pdf, content_type: ["application/pdf"]

	validates :title, length: { in: 4..100 }
	validates :description, length: { in: 4..5000 }
	validates :sponsors_title, length: { in: 4..100 }
	validates :registration_title, length: { in: 4..100 }
	validates :agenda_title, length: { in: 4..100 }
	validates :speakers_title, length: { in: 4..100 }


	has_many :agenda_entry, :dependent => :delete_all
	has_many :sponsors, :dependent => :delete_all
	has_many :speakers, :dependent => :delete_all
end
