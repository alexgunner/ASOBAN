class DeleteRegistyFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :registry
  end
end
