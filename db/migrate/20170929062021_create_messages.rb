class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :name
      t.string :lastname
      t.string :email
      t.string :phone
      t.text :message

      t.timestamps
    end
  end
end
