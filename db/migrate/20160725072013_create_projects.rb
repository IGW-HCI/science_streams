class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.text :about_us
      t.string :slug, index: true
      t.boolean :auto_approve_comments, default: false

      t.timestamps
    end
  end
end
