class AddAttachmentImageToContributionImages < ActiveRecord::Migration
  def self.up
    change_table :contribution_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :contribution_images, :image
  end
end
