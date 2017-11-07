class About < ApplicationRecord
  include PgSearch
  multisearchable :against => [:mission, :vision, :document_title]
  validates :mission, :vision, :document_title, presence: true
  has_attached_file :statute_pdf
  validates_attachment_presence :statute_pdf
  validates_attachment_content_type :statute_pdf, :content_type => ["application/pdf"]
end
