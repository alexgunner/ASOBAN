class Contact < ApplicationRecord
  include PgSearch
  multisearchable :against => [:address, :phone_numbers, :emails]
  validates :address, :phone_numbers, length: { minimum: 7, maximum: 100 }
  validate :emails_array_must_have_valid_emails
  validate :phone_numbers_array_must_have_valid_phone_numbers

  def emails_array_must_have_valid_emails
    unless emails.blank?
      emails_array = emails.split('%')
      emails_array.each do |email|
        if /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i.match(email).nil?
          errors.add(:emails, email + ' no es una direccion de correo valida')
        end
      end
    end
  end

  def phone_numbers_array_must_have_valid_phone_numbers
    unless phone_numbers.blank?
      phone_numbers_array = phone_numbers.split('%')
      phone_numbers_array.each do |phone_number|
        if /^[0-9\(\)\+\-\s]*$/.match(phone_number).nil?
          errors.add(:phone_numbers, phone_number + ' solo debe contener números, guiones y parentesis.')
        end
      end
    end
  end

  def join_email_and_phone_arrays_into_contact! emails_array, phone_numbers_array
    self.emails = emails_array.join('%')
    self.phone_numbers = phone_numbers_array.join('%')
  end

end
