class AddTitleToAgendaEntry < ActiveRecord::Migration[5.0]
  def change
    add_column :agenda_entries, :title, :string
  end
end
