class DeleteProgramFromEvent < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :program
  end
end
