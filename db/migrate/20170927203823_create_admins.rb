class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string :fist_name
      t.string :last_name
      t.boolean :can_manage_contact
      t.boolean :can_manage_faq
      t.boolean :can_manage_about
      t.boolean :can_manage_articles
      t.boolean :can_manage_events
      t.boolean :can_manage_links
      t.boolean :can_manage_multimedia
      t.boolean :can_manage_carousel
      t.boolean :can_manage_newsletter

      t.timestamps
    end
  end
end
