class AddImageDataColumnToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :image_data, :text
  end
end
