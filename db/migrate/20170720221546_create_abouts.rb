class CreateAbouts < ActiveRecord::Migration[5.0]
  def change
    create_table :abouts do |t|
      t.text :mission
      t.text :vision
      t.string :statute_pdf

      t.timestamps
    end
  end
end
