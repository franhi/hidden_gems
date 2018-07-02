class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.references :post_tag, foreign_key: true
      t.references :user_tag, foreign_key: true

      t.timestamps
    end
  end
end
