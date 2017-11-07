class AddFieldsToAbouts < ActiveRecord::Migration[5.0]
  def change
    add_column :abouts, :history, :text
    add_column :abouts, :philosophy, :text
  end
end
