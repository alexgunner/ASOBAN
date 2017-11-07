class AddRegistrationTitleToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :registration_title, :string, :default => 'Registro'
  end
end
