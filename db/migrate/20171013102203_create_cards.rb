class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.boolean :twitter
      t.boolean :certifications
      t.boolean :newsfeed
      t.string :title
      t.text :content
      t.string :url

      t.timestamps
    end
  end
end
