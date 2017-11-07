class AddRegistrationToEvent < ActiveRecord::Migration[5.0]
  def change
    change_table :events do |t|
      t.attachment :registration_image
      t.attachment :registration_pdf
    end
  end
end
