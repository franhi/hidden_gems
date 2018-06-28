class ChangeSavesToFavorites < ActiveRecord::Migration[5.2]

  def change
    rename_table :saves, :favorites
  end
end
