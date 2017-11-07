class CreateSpeakers < ActiveRecord::Migration[5.0]
  def change
    create_table :speakers do |t|
      t.string :title
      t.attachment :image
      t.attachment :pdf
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
