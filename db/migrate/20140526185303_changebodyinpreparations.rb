class Changebodyinpreparations < ActiveRecord::Migration
  def self.up
    change_table :preparations do |t|
      t.change :body, :text, :limit => nil
    end
  end

  def self.down
    change_table :preparations do |t|
      t.change :body, :text, :limit => nil
    end
  end
end
