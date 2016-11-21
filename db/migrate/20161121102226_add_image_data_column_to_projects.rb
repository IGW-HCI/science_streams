class AddImageDataColumnToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :image_data, :text
  end
end
