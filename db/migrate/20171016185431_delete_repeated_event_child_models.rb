class DeleteRepeatedEventChildModels < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :sponsors
  end
end
