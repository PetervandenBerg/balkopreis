class AddTimeToPreparations < ActiveRecord::Migration
  def change
    change_table :preparations do |t|
      t.timestamps
    end
  end
end
