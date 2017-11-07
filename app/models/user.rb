class User < ApplicationRecord
  devise :timeoutable, :timeout_in => 15.minutes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :registerable, :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  # has_one :admin
  belongs_to :admin
end
