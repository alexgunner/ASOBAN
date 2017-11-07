class AddAttachmentPic1Pic2Pic3ToCarousels < ActiveRecord::Migration
  def self.up
    change_table :carousels do |t|
      t.attachment :pic1
      t.attachment :pic2
      t.attachment :pic3
    end
  end

  def self.down
    remove_attachment :carousels, :pic1
    remove_attachment :carousels, :pic2
    remove_attachment :carousels, :pic3
  end
end
