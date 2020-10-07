class AddRatingColumnToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :rating, :integer
  end
end
