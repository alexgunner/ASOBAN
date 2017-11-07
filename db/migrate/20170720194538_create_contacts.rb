class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :address
      t.string :emails
      t.string :phone_numbers

      t.timestamps
    end
  end
end
