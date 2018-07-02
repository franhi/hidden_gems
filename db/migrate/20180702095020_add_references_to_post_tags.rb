class AddReferencesToPostTags < ActiveRecord::Migration[5.2]
  def change
    add_reference :post_tags, :posts, index: true
    add_reference :post_tags, :tags, index: true
  end
end
