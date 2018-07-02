class AddReferencesToUserTags < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_tags, :users, index: true
    add_reference :user_tags, :tags, index: true
  end
end
