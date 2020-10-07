class ChangeImagesToImage < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :images, :image
  end
end
