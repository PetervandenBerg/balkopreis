class CreatePreparations < ActiveRecord::Migration
  def change
    create_table :preparations do |t|
      t.string :title
      t.string :body
      t.integer :admin_id
    end
  end
end
