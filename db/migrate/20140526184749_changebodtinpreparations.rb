class Changebodtinpreparations < ActiveRecord::Migration
  def change
    change_column :preparations, :body, :text
  end
end
