class AddReferencesToPostTags < ActiveRecord::Migration[5.2]
  def change
    add_reference :post_tags, :post, index: true
    add_reference :post_tags, :tag, index: true
  end
end
