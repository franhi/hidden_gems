class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :description
      t.string :category
      t.string :title
      t.string :status
      t.string :location
      t.string :photo
      t.date :begin_date
      t.date :end_date
      t.float :latitude
      t.float :longitude
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
