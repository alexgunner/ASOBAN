class CreateSponsors < ActiveRecord::Migration[5.0]
  def change
    create_table :sponsors do |t|
      t.attachment :image
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
