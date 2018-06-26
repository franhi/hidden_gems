class ChangePostsLocation < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :location, :address
  end
end
