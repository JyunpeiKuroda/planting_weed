class RemoveFileFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :file, :string
  end
end
