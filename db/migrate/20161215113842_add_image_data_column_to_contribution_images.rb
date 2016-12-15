class AddImageDataColumnToContributionImages < ActiveRecord::Migration[5.0]
  def change
    add_column :contribution_images, :image_data, :text
  end
end
