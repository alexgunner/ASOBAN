class AddSubsectionTitleToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :agenda_title, :string, :default => 'Agenda'
    add_column :events, :speakers_title, :string, :default => 'Conferencistas'
    add_column :events, :sponsors_title, :string, :default => 'Auspiciadores'
  end
end
