class AddFieldsToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :program, :string
    add_column :events, :registry, :string
    add_column :events, :sponsors, :string
    add_column :events, :location, :string
  end
end
