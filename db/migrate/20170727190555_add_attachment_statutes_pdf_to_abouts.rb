class AddAttachmentStatutesPdfToAbouts < ActiveRecord::Migration
  def self.up
    rename_column :abouts, :statute_pdf, :document_title
    change_table :abouts do |t|
      t.attachment :statute_pdf
    end
  end

  def self.down
    remove_attachment :abouts, :statute_pdf
    rename_column :abouts, :document_title, :statute_pdf
  end
end
