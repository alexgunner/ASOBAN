class Faq < ApplicationRecord
  include PgSearch
  multisearchable :against => [:question, :answer]
  validates :question, :answer, presence: true
  validates :question, length: { minimum: 10, maximum: 100 }
  validates :answer, length: { minimum: 10, maximum: 600 }
end
