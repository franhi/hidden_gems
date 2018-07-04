class AddReferencesToUserTags < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_tags, :user, index: true
    add_reference :user_tags, :tag, index: true
  end
end
