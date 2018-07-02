class RemoveIdFromTags < ActiveRecord::Migration[5.2]
  def change
    remove_column :tags, :post_tag_id
    remove_column :tags, :user_tag_id

  end
end
