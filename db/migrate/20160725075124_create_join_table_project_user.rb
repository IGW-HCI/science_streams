class CreateJoinTableProjectUser < ActiveRecord::Migration[5.0]
  def change
    create_join_table :projects, :users do |t|
      t.index [:project_id, :user_id]
      t.index [:user_id, :project_id]
      t.integer :project_role, default: 0, index: true
    end
  end
end
