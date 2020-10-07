class RemoveImage1Default < ActiveRecord::Migration[6.0]
  def change
    change_column_default :items, :image1, nil
  end
end
