class AddKindIdToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :kind_id, :integer
  end
end
