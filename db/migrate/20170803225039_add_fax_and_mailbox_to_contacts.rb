class AddFaxAndMailboxToContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :fax, :string
    add_column :contacts, :mailbox, :string
  end
end
