class DropBeenThereTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :been_theres
  end
end
