class AddKindIdToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :kind_id, :integer
  end
end
