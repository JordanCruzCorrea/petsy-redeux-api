class ChangeImageToImage1 < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :image, :image1
  end
end
