class Admin < ApplicationRecord
  has_one :user, dependent: :destroy
  # belongs_to :user
end
