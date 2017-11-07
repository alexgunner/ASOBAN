class AddCityToContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :city, :string
  end
end
