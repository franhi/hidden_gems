class ChangeColumnsToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :street, :string
    add_column :posts, :city, :string
    add_column :posts, :country, :string
    remove_column :posts, :address
  end
end
