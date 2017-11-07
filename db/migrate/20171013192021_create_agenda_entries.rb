class CreateAgendaEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :agenda_entries do |t|
      t.attachment :pdf
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
