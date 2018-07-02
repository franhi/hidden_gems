class RemoveReferencesFromTags < ActiveRecord::Migration[5.2]
  def change
    remove_reference :tags, :post_tag, index: true, foreign_key: true
    remove_reference :tags, :user_tag, index: true, foreign_key: true

  end
end
