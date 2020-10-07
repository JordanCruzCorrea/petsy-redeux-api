class AddImageColumnsToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :image2, :string
    add_column :items, :image3, :string
  end
end
