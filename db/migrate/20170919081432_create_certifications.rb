class CreateCertifications < ActiveRecord::Migration[5.0]
  def change
    create_table :certifications do |t|
      t.string :name
      t.string :lastname
      t.string :ci
      t.string :email
      t.string :city
      t.string :institution_name
      t.string :nit
      t.string :phone
      t.string :legal_address
      t.string :charge
      t.date :start_date
      t.string :observations

      t.timestamps
    end
  end
end
