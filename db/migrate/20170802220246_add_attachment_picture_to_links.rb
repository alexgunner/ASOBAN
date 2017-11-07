class AddAttachmentPictureToLinks < ActiveRecord::Migration
  def self.up
    change_table :links do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :links, :picture
  end
end
